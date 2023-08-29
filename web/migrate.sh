#!/bin/bash
# You can also create environment variable 
SUPERUSER_EMAIL=${DJANGO_SUPERUSER_EMAIL:-"admin@admin.com"}

cd /app/
/opt/venv/bin/python manage.py migrate --noinput
# Create superuser for production
/opt/venv/bin/python manage.py createsuperuser --email $SUPERUSER_EMAIL --noinput || true

# We make migrations after creating superuser but as you can think
# by enertion we should put it in .Dockerfile but the answer is NO,
# as there we still don't have access to a database