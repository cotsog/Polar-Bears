FROM python:3 AS django-docker
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD ./install/requirements-docker.txt /code/
RUN pip3 install -r requirements-docker.txt
ADD ./my_app_test /code/

EXPOSE 8000
