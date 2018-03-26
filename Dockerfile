FROM python:3 AS django-docker
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip3 install -r requirements.txt
ADD ./my_app_test /code/

EXPOSE 8000
