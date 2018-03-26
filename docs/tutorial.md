# Instructions__django__ and __docker__ intergration.

# Create a __Dockerfile__.
1. Make a file called `Dockerfile` with no extensions.
  - With the following contents:

  ```
  FROM python:3
  ENV PYTHONUNBUFFERED 1
  RUN mkdir /code
  WORKDIR /code
  ADD requirements.txt /code/
  RUN pip install -r requirements.txt
  ADD . /code/
  ```
2. Make a python requirements file for your ideal environment. Place it where the dockerfile above will find it.
  - `pip3 freeze > requirements.txt`
3. Make a docker-compose file.
  - With the following contents:

  ```yml
  version: '3'

  services:
    db:
      image: postgres
    web:
      build: .
      command: python3 manage.py runserver 0.0.0.0:8000
      volumes:
        - .:/code
      ports:
        - "8000:8000"
      depends_on:
        - db
  ```



#### Create the Django-Docker container
1. Create the django project.
  - `docker-compose run web django-admin.py startproject code/my_django_project .`
2. Run Migrate in django.
  - `docker-compose run web pip3 install -r requirements.txt && python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000`
3. Build the image.
  - `docker-compose up`
4. Visit the site.
  - `http://192.168.99.100:8000/`




## Usefull commands
#### In case you forgot how to make or enter a python environment.
1. Create a python virtual environment.
  - `python3 -m venv python_env`
2. Enter the python environment.
  - `. python_env/bin/activate`
3. Install dependencies for django.
  - `pip3 install -r requirements.txt`

#### Build command:
`docker build -t weird_funky_title .`

#### Run command:
`docker run -it -p 8000:8000 weird_funky_title /my_app/start_gunicorn.sh`


#### Delete all containers
`docker rm $(docker ps -a -q)`
#### Delete all images
`docker rmi $(docker images -q)`

#### first, get the images on your system and their ids
$ docker images
#### use one of those ids to take a closer look
$ docker inspect image-id

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
