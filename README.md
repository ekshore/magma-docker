# Magma Docker
This project is for running a magma server inside of a docker container. The main branch is for a completely clean server image. Other branches maybe added for specific mod packs.

## Usage
- Clone this repository `git clone git@github.com:ekshore/magma-docker.git`
- Build docker image from file `docker build . -t magma-image`
- You'll need to have a docker volume mounted if you want data to be saved if you ever shut down the server. So build a volume `docker volume create magma-volume`
- Star the server container `docker run --name magma-container -p 25565:25565 -v magma-volume:/server magma-image`
