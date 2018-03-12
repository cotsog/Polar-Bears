FROM alpine:3.7
EXPOSE 8000

RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
rm -r /root/.cache

COPY ./my_app /my_app
RUN pip3 install -r /my_app/requirements.txt
WORKDIR /my_app
CMD ["/my_app/start.sh"]
