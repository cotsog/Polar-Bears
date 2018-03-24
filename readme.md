# Docker Deployment Tests
"Learning is recursion, recursion is recursion and more recursion"
- Each step is explained individually

## Working
- Django 2.0.3
- Gunicorn 19.7.1
- Environment variables `local.env`

__NOTES:__
- Develop with `docker-compose up`, the `my_app_test` folder is actually a docker volume.
- Gunicorn is not recommended during development, only deployment.

## Tasks
- Add the most recent version of `REST framework` to `Django`
  - With some other goodies... like `caddy` and `guardian`
- Add Continuous Integration
  - With `Travis CI` because I haven't used it yet
  - Leave `Heroku` for later
  - Comparison to `CircleCI`
    - Do I really want to compare it with `Jenkins`?
- Add an `nginx` container
  - Tie it in with the django container
  - Make and add temp SSL certificates
- Add frontend JS web interface
  - Simple gulp project `black-bears` submodule
  - Intergrate all elements (`nginx`, `gunicorn`, `django`, `frontend`)
  - Simple `Backbone` and `Marionette` project submodule
- Refactor `Django` core project into submodule
- Add a `Celery` container
- Add `Rabbitmq`
  - As a container? or incorporate it
- Setup `secrets` for the deployment of swarms

## Extras
#### For docker toolbox, use docker's ip instead of `localhost`.
Use `docker-machine ip` odds are its going to be `192.168.99.100` or `192.168.99.101`, add the port according to what you've exposed in the container.

#### Forgot how to add a submodule?
Command is `git submodule add` then the url (with .git or without) and a new name if you want to change it, or even a path and name.

`git submodule add https://github.com/sebest-blog/gunicorn-with-docker/ gunicorn-docker/gunicorn-module`

#### You have to remove submodules manually
Why? I don't know, it's just lame like that. Maybe that will change sometime, but at least this will help.
1. Either run the first or second option, depending on if you already have submodules that you want to keep.  
  - `git rm -f .gitmodules`
  - Remove the submodule inside the `.gitmodules` file.
2. Remove the submodule folder from `.`
  - `git rm -fr gunicorn-docker/gunicorn-module`
  - Delete the corresponding folder __inside__ `.git/modules/`
3. Delete the folder itself.
  - `rm -rf gunicorn-docker`
