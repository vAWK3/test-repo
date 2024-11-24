#!/bin/bash
# Run database migrations
export DJANGO_SETTINGS_MODULE=app.settings

python manage.py makemigrations
python manage.py migrate

cd /app/app
gunicorn app.wsgi:application --bind 0.0.0.0:${PORT:-8000}
    