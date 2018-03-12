#!/bin/sh

# Start Gunicorn processes
echo Starting Gunicorn.
# folder.django_app.settings.
exec gunicorn my_app.wsgi:application \
    --bind 0.0.0.0:8000 \
    --workers 3
# Number of workers = (Number of CPU Cores * 2) + 1
