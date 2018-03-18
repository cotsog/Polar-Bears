FROM alpine:3.7 AS gunicorn_base

# INSTALL REQS
RUN apk add --update --no-cache\
    build-base \
    python3 \
    python3-dev \
    linux-headers \
    nginx

# NGINX USER
RUN adduser -D -g 'www' www \
    && mkdir /www \
    && chown -R www:www /var/lib/nginx \
    && chown -R www:www /www

# UPDATE PIP
RUN python3 -m ensurepip \
    && pip3 install --upgrade pip setuptools


FROM gunicorn_base AS gunicorn_app

# INSTALL PIP REQS
COPY ./my_app/ /my_app/
RUN pip3 install -r /my_app/requirements.txt

# REDUCE SIZE OF IMAGE {CLEAN_UP}
RUN rm -r /usr/lib/python*/ensurepip \
    && rm -r /root/.cache \
    && rm -rf /var/cache/apk/*


FROM gunicorn_app AS gunicorn_django
EXPOSE 8000

COPY --from=gunicorn_app /my_app/ /my_app/
WORKDIR /my_app
# ENTRYPOINT ["/bin/sh"]
# CMD ["./start_gunicorn.sh"]
