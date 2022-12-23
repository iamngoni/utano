from rest_framework import serializers


class SignInPayloadSerializer(serializers.Serializer):
    username = serializers.CharField(required=True)
    password = serializers.CharField(required=True)

    def create(self, validated_data):
        return super().create(validated_data)
