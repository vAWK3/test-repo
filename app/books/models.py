from django.db import models
from author.models import Author
from django.utils import timezone

# Create your models here.
class Books(models.Model):
    """
    Books Model
    """

    title = models.CharField(max_length=225)
    slug = models.SlugField(default="", unique_for_date='created_at')
    description = models.TextField()
    published_at = models.DateField(null=False)
    author = models.ForeignKey(Author, on_delete=models.CASCADE, related_name="author_books")
    updated_at = models.DateTimeField(auto_now_add=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title