# Polar-Bears
"Learning is recursion, recursion is recursion and more recursion"
- Each step is explained individually

## Working
- Django 2.0.3
- Gunicorn 19.7.1
- Environment variables `local.env`

__NOTES:__
- Develop with `docker-compose up`, the `my_app_test` folder is actually a docker volume.
- Run unittests with ``python -m unittest discover ./test  "*_test.py"``
- Gunicorn is not recommended during development, only deployment.

## Tasks
- [ ] Add the most recent version of `REST framework` to `Django`
  - With some other goodies... like `caddy` and `guardian`
- [ ] Add Continuous Integration
  - With `Travis CI` because I haven't used it yet
    - Can't run unit tests without having the docker machine IP for travis.
  - Leave `Heroku` for later
  - Comparison to `CircleCI`
    - Do I really want to compare it with `Jenkins`?
  - Add coveralls?
- [ ] Add an `nginx` container
  - Tie it in with the django container
  - Make and add temp SSL certificates
- [ ] Add frontend JS web interface
  - Simple gulp project `black-bears` submodule
  - Intergrate all elements (`nginx`, `gunicorn`, `django`, `frontend`)
  - Simple `Backbone` and `Marionette` project submodule
- [ ] Refactor `Django` core project into submodule
- [ ] Add a `Celery` container
- [ ] Add `Rabbitmq`
  - As a container? or incorporate it
- [ ] Setup `secrets` for the deployment of swarms
