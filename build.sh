#!/bin/bash

dockerhub_username=matvh15
app_name=lbg-api-app
tag=latest
image_name=$dockerhub_username/$app_name:$tag

echo "Building image:"
docker build -t $image_name .
echo "Pushing image"
docker push $image_name

echo "Stopping and removing existing containers"
docker stop $app_name
docker rm $app_name

echo "Running container"
docker run -d -p 80:8080 --name $app_name $image_name
