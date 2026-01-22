#!/bin/sh
python /app/backend/manage.py migrate
python /app/backend/manage.py runserver 0.0.0.0:5000