#!/bin/bash
# This is bash script
APP_PORT=${PORT:-8000}
cd /app/
# We define a wsgi server configuration in bash 
# gunicorn will run 
# /Users/nikitalutsai/Desktop/Programming/django-k8s/venv/bin/python manage.py runserver
# but in production
# this will do something like:
#  /Users/nikitalutsai/Desktop/Programming/django-k8s/venv/bin/gunicorn django_k8s.wsgi:application
/opt/venv/bin/gunicorn --worker-tmp-dir /dev/shm django_k8s.wsgi:application --bind "0.0.0.0:${APP_PORT}"
