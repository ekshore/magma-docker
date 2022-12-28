# Magma Docker
This project is for running a magma server inside of a docker container. The main branch is for a completely clean server image. Other branches maybe added for specific mod packs.

## Usage
- Clone this repository `git clone git@github.com:ekshore/magma-docker.git`
- Build docker image from file `docker build . -t magma-image`
- You'll need to have a docker volume mounted if you want data to be saved if you ever shut down the server. So build a volume `docker volume create magma-volume`
- Star the server container `docker run --name magma-container -p 25565:25565 -v magma-volume:/server magma-image`

## Warning
There is still work that needs to be done to this project. There is currently no shutdown hooks, stopping the container does not let the server shut down first. There is also no way of accessing the server console as of the moment. You'll want to manually edit your ops.json file to give yourself ops to be able to shut things down from in game.