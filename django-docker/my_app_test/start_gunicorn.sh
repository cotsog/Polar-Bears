# Start Gunicorn processes
echo Starting Gunicorn.
# folder.django_app.settings.
# Number of workers = (Number of CPU Cores * 2) + 1
exec gunicorn my_app_test.wsgi -b 0.0.0.0:8000
    # --workers 3
