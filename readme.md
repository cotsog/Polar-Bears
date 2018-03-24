# Docker Deployment Tests
"Learning is recursion, recursion is recursion and recursion.""
Each step is explained individually.

***

## Working
- Django 2.0.3
- Gunicorn 19.7.1
- Develop with `docker-compose up`
- Environment variables `local.env`

__NOTE__: Gunicorn is also implemented but not recommended during development, only deployment.


## Tasks
- Add the most recent version of rest to Django
  - With some other goodies... like caddy and guardian.
- Add an nginx container
- Add frontend JS web interface
  - Simple gulp project `black-bears` submodule
  - Simple Backbone-Marionette project
- Convert Django core project into submodule
- Add a celery container
- Add rabbitmq
- Setup secrets for the deployment of swarms



## Extras
#### Forgot how to add a submodule? No Problem! Here you go.
git submodule add https://github.com/sebest-blog/gunicorn-with-docker/ gunicorn-docker/gunicorn-module

#### If you're using docker toolbox, use docker's ip instead of `localhost`.
Use `docker-machine ip` odds are its going to be `192.168.99.100` or `192.168.99.101`, add the port according to what you've exposed in the container. 

#### You have to remove submodules manually... Why? I don't know, it's just lame like that. Maybe that will change sometime, but this will help.
1. Either run the first or second option, depending on if you already have submodules that you want to keep.  
  - `git rm -f .gitmodules`
  - Remove the submodule inside the `.gitmodules` file.
2. Remove the submodule folder from .
  - `git rm -fr gunicorn-docker/gunicorn-module`
  - Delete the corresponding folder __inside__ `.git/modules/`
3. Delete the folder itself.
  - `rm -rf gunicorn-docker`
