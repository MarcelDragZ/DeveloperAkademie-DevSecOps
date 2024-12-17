#!/usr/bin/env bash


# Create superuser if it does not already exist
python manage.py shell -c "
from django.contrib.auth import get_user_model;
User = get_user_model();
if not User.objects.filter(username='${DJANGO_SUPERUSER_USERNAME}').exists():
    User.objects.create_superuser('${DJANGO_SUPERUSER_USERNAME}', '${DJANGO_SUPERUSER_EMAIL}', '${DJANGO_SUPERUSER_PASSWORD}')
"

# Start the Gunicorn server
gunicorn conduit.wsgi:application --bind 0.0.0.0:8000
