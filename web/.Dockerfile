FROM python:3.10.12-slim
# Copies all the files from the application to the Docker container,
# except .dockerignore
COPY . /app
# Runs a working directory in our main /app folder
WORKDIR /app

# Run virtual environment on your container placed in special folder /opt/
# as also our app will not have venv folder itself as it is in .dockerignore
RUN python3 -m venv /opt/venv

# Install all needed dependencies, as we will run it on Linux we will need to 
# specify where the pip is allocated, it is recommended to also update pip
RUN pip install pip --upgrade && \
RUN /opt/venv/bin/pip install -r requirements.txt && \
RUN chmod +x entrypoint.sh

# Now we need to activate a venv, normally you'll do it with python manage.py runserver
# but is the same as doing: 
# /Users/nikitalutsai/Desktop/Programming/django-k8s/venv/bin/python manage.py runserver
# So in this case we will run those type of commands in entrypoint.sh

CMD ["/app/entrypoint.sh"]
