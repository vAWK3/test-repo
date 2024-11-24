from rest_framework import viewsets
from rest_framework.views import APIView
from django.shortcuts import get_list_or_404
from .models import Books
from .serializers import BooksModelSerializer
from rest_framework import status
from rest_framework.response import Response


class BooksModelView(viewsets.ModelViewSet):
    """
    Books Model Views
    """
    serializer_class = BooksModelSerializer
    queryset = Books.objects.all()

# Create your views here.
class GetBooksByAuthorView(APIView):
    """
    Retrieve book by author id
    """

    def get(self, request, author_id):
        """
        GET endpoint to retrieve books by author id
        """

        books = get_list_or_404(Books, author_id=author_id)

        response_data = BooksModelSerializer(books, many=True).data
        return Response(response_data, status=status.HTTP_200_OK)

