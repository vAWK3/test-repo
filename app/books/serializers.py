from rest_framework import serializers
from .models import Books
from author.models import Author

class BooksModelSerializer(serializers.ModelSerializer):
    """
    Author Model Serializer
    """
    author = serializers.PrimaryKeyRelatedField(queryset=Author.objects.all())

    class Meta:
        fields = ["id", "title", "slug", "description", "published_at", "author"]
        model = Books

    def validate_author(self, value):
        if not Author.objects.filter(id=value.id).exists():
            raise serializers.ValidationError("Invalid Author ID")
        return value