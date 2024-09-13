#!/usr/bin/env bash
set -e

echo "Waiting for postgres to connect ..."

while ! nc -z postgres_container 5432; do
  sleep 0.1
done

echo "PostgreSQL is active"


python manage.py collectstatic --noinput

python manage.py makemigrations
python manage.py migrate

# Superuser erstellen
echo "from django.contrib.auth import get_user_model;
User = get_user_model();
username = '${DJANGO_SUPERUSER_USERNAME}';
email = '${DJANGO_SUPERUSER_EMAIL}';
password = '${DJANGO_SUPERUSER_PASSWORD}';
if not User.objects.filter(username=username).exists():
    User.objects.create_superuser(username=username, email=email, password=password);
else:
    print(f'Superuser {username} already exists.');
" | python manage.py shell

echo "Superuser creation finished"

gunicorn truck_signs_designs.wsgi:application --bind 0.0.0.0:8020

echo "Postgresql migrations finished"

python manage.py runserver


