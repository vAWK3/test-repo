#!/bin/bash
export DJANGO_SETTINGS_MODULE=app.settings

cd /app/app
gunicorn app.wsgi:application --bind 0.0.0.0:${PORT:-8000}
    