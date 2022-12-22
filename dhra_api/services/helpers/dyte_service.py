from decouple import config
import requests
from loguru import logger
from datetime import datetime

from api.views.therapy.tasks import notify_parties_of_scheduled_meeting
from patient.models import Profile
from therapist.models import Profile as TherapistProfile
from therapy.models import TherapyMeeting


class DyteService:
    def __init__(self):
        self.dyte_api = config("DYTE_BASE_URL")
        self.organization_id = config("DYTE_ORGANIZATION_ID")
        self.api_client = requests.Session()
        self.api_client.headers.update({"Authorization": config("DYTE_API_KEY")})

    def create_meeting(
        self, patient: Profile, therapist: TherapistProfile, start_time: datetime
    ):
        logger.info("[dyte service]: Creating meeting")
        payload = {
            "title": f"{patient.user.get_full_name()} session with {therapist.user.get_full_name()}",
            "authorization": {"waitingRoom": True},
        }
        response = self.api_client.post(
            f"{self.dyte_api}/organizations/{self.organization_id}/meeting",
            json=payload,
        )

        if response.status_code == 200:
            logger.info("[dyte service]: meeting created")
            meeting_data = response.json().get("data").get("meeting")
            logger.info("[dyte service]: saving meeting details to db")
            therapy_meeting = TherapyMeeting(
                therapist=therapist,
                patient=patient,
                start_time=start_time,
                meeting_id=meeting_data.get("id"),
                meeting_title=meeting_data.get("title"),
                meeting_room_name=meeting_data.get("roomName"),
            )
            therapy_meeting.save()
            logger.info("[dyte service]: meeting details persisted")

            notify_parties_of_scheduled_meeting.delay(therapy_meeting)

            return therapy_meeting
        else:
            return None

    def cancel_meeting(self, meeting: TherapyMeeting):
        logger.info("[dyte service]: cancelling meeting")
        payload = {"status": "CLOSED"}
        response = self.api_client.post(
            f"{self.dyte_api}/organizations/{self.organization_id}/meetings/{meeting.meeting_id}",
            json=payload,
        )

        if response.status_code == 200:
            logger.info("[dyte service]: meeting cancelled")
            return
        else:
            raise Exception("Could not cancel meeting")

    def add_therapist_as_participant(
        self, meeting: TherapyMeeting, therapist: TherapistProfile
    ):
        participant_details = {
            "clientSpecificId": therapist.id,
            "userDetails": {
                "name": therapist.user.get_full_name(),
            },
            "roleName": "host",
        }

        response = self.api_client.post(
            f"{self.dyte_api}/organizations/{self.organization_id}/meetings/{meeting.meeting_id}/participant",
            json=participant_details,
        )

        if response.status_code == 200:
            response_json = response.json()
            success = response_json.get("success")
            if success:
                auth_response = response_json.get("data").get("authResponse")
                user_added = auth_response.get("userAdded")
                if user_added:
                    auth_token = auth_response.get("authToken")
                    meeting.therapist_auth_token = auth_token
                    meeting.save()

                    return auth_token
                else:
                    logger.error("User not added")
                    logger.error(response.text)
                    raise Exception("User already added")
            else:
                logger.error(response.text)
                raise Exception("Failed to create participant")
        else:
            logger.error(response.text)
            raise Exception("Failed to create participant")

    def add_patient_as_participant(self, meeting: TherapyMeeting, patient: Profile):
        participant_details = {
            "clientSpecificId": patient.id,
            "userDetails": {
                "name": patient.user.get_full_name(),
            },
            "roleName": "participant",
        }

        response = self.api_client.post(
            f"{self.dyte_api}/organizations/{self.organization_id}/meetings/{meeting.meeting_id}/participant",
            json=participant_details,
        )

        if response.status_code == 200:
            response_json = response.json()
            success = response_json.get("success")
            if success:
                auth_response = response_json.get("data").get("authResponse")
                auth_token = auth_response.get("authToken")
                meeting.patient_auth_token = auth_token
                meeting.save()

                return auth_token
            else:
                logger.error(response.text)
                raise Exception("Failed to create participant")
        else:
            logger.error(response.text)
            raise Exception("Failed to create participant")
