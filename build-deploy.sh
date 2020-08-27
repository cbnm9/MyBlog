#!/bin/bash

# Set docker image and container title
TITLE=blog

# Set name of images
SPRING_IMG=${TITLE}/spring
FRONT_IMG=${TITLE}/front

# Set name of containers
SPRING_DOCKER=${TITLE}-spring
FRONT_DOCKER=${TITLE}-front

pwd

# Remove current image
docker rmi -f $SPRING_IMG || true
docker rmi -f $FRONT_IMG || true

# Remove and force stop current running container
docker rm -f $SPRING_DOCKER || true
docker rm -f $FRONT_DOCKER || true

# Move to spring folder for build and deploy spring backend
cd springback
pwd

# Build spring project
./mvnw package

# Make docker image
docker build -t $SPRING_IMG .

# Create docker container and run
# sudo docker run --name $BACK_DOCKER --network="host" -v tvility:/tvility -d $BACK_IMG
docker run --name $SPRING_DOCKER --network="host" -d $SPRING_IMG

# Move to frontend folder for build and deploy frontend
cd ../frontend
pwd

# Make docker image
docker build -t $FRONT_IMG .

# Create docker container and run
docker run --name $FRONT_DOCKER -p 8500:8500 -d $FRONT_IMG