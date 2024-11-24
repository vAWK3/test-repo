from rest_framework import serializers
from .models import Author

class AuthorModelSerializer(serializers.ModelSerializer):
    """
    Author Model Serializer
    """

    class Meta:
        fields = ["id", "first_name", "last_name"]
        model = Author