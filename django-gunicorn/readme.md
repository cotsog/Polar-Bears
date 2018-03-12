# Test gunicorn with django project

### Build command:
`docker build -t weird_funky_title .`

### Run command:
`docker run -it -p 8000:8000 weird_funky_title /my_app/start.sh`


### Delete all containers
`docker rm $(docker ps -a -q)`
### Delete all images
`docker rmi $(docker images -q)`
