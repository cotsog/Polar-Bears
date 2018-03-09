# Testing __nginx__ and __docker__ intergration with command line arguments.

## Running the container.
These are docker command line arguments for beginners.
```
docker run --name nginx-docker -p 80:80 -d -v ~/nginx-docker/html:/usr/share/nginx/html nginx
```
- `run` will run the container.
- `--name nginx-docker` gives the container a name.
  - `nginx-docker` is the name chosen by the user, could be anything.
- `-p 80:80` defines the port mapping.
  - `80:80` First number is the machines port, second is the containers port.
- `-d` Runs the container in the background, it will automatically print the containers ID.
- `-v ~/nginx-docker/html:/usr/share/nginx/html` Adds a local volume to the docker container.
  - `~/nginx-docker/html:/usr/share/nginx/html` Specifies the path of the local volume on the machine, and where to copy it inside the docker container.

## Copying files from the container to the local machine
```
docker cp nginx-docker:/etc/nginx/conf.d/default.conf default.conf
```
- `cp nginx-docker:/etc/nginx/conf.d/default.conf` Copy the file from the container.
  - `nginx-docker:/etc/nginx/conf.d/default.conf` Container ID, and the path where the file resides inside the container that we want to copy.
- `default.conf` filename and path where we want to store the copy outside the container. 


## Stopping the container
```
docker stop awesome_saucer
docker rm awesome_saucer
```
- `stop awesome_saucer` stops the running container.
  - `awesome_saucer` is the name chosen by the user when the container was created.
- `rm awesome_saucer` removes the container.
  - `awesome_saucer` is the name chosen by the user when the container was created.
