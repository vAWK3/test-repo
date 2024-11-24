                        #!/bin/bash
    python manage.py makemigrations
    python manage.py migrate

    cd /app/app
    export DJANGO_SETTINGS_MODULE=app.settings
    gunicorn app.wsgi:application --bind 0.0.0.0:${PORT:-8000}
    