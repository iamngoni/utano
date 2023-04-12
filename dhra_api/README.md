# Utano API

- Utano REST API with endpoints for authentication, patient management, point of service, pharmacy, labs, etc

## Payloads

The payload from the endpoints has a `request_id` field and `payload` field that contains the `AES_ECB` encrypted data.

```json
{
    "payload": "vC5ozKMnRRWeIO3YuqyxN9N9HvLIn0yYVEN288...",
    "request_id": "req_wOCeodCcKaviRyX9Bx9tsskrP1cz3Om"
}
```

The decoded payload structure is as follows:

```json
{
    "data": {
        "admins": 1,
        "doctors": 0,
        "employees": 2,
        "lab_technicians": 0,
        "nurses": 1,
        "patients": 1,
        "rooms": 0
    },
    "issues": null,
    "message": "OK",
    "status": true,
    "status_description": "Request was executed successfully",
    "version": 1.0,
    "versioned_by": "ModestNerds, Co",
}
```