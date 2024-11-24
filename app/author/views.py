from rest_framework import viewsets
from .models import Author
from .serializers import AuthorModelSerializer

# Create your views here.

class AuthorViewSet(viewsets.ModelViewSet):
    """
    Author View Set
    """

    serializer_class = AuthorModelSerializer
    queryset = Author.objects.all()

