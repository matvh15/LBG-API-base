#!/bin/bash

dockerhub_username=matvh15
app_name=lbg-api-app
tag=latest
image_name=$dockerhub_username/$app_name:$tag
container_port=5000

echo "Building image:"
docker build -t $image_name .
echo "Pushing image"
docker push $image_name

echo "Stopping and removing existing containers"
docker stop $app_name
docker rm $app_name

echo "Running container"
docker run -d -p 80:$container_port --name $app_name --env PORT=$container_port $image_name
