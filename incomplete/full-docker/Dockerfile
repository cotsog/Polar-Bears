FROM ubuntu:17.10
EXPOSE 8000
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y python3 python3-pip
COPY ./app /app
COPY ./config /config
RUN pip3 install -r /config/requirements.pip

WORKDIR /app
ENTRYPOINT ["python3"]
# RUN sleep 500
CMD ["/app/manage.py", "runserver", "0.0.0.0:8000"]
