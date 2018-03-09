FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.pip /code/
RUN pip3 install -r requirements.pip
ADD . /code/
