from django.urls import (
    path, 
    include
)
from rest_framework.routers import DefaultRouter
from . import views

router = DefaultRouter()
router.register('books', views.BooksModelView)

app_name = 'books'

urlpatterns = [
    path("", include(router.urls)),
    path("books/author/<int:author_id>", views.GetBooksByAuthorView.as_view(), name="get-books-by-author")
]