#!/bin/sh
cd /app/backend
echo "ALLOWED_HOSTS = ['${ALLOWED_HOST}']" >> conduit/.env
python manage.py migrate
gunicorn conduit.wsgi:application --bind 0.0.0.0:5000