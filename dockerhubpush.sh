#!/bin/bash
image=$1
tag_name=$2
dockerhub_repo=$3
username=$4
passcode=$5
#building image
docker build -t ${image} .
#tagging the image
docker tag ${image} ${username}/${dockerhub_repo}:${tag_name}
fullname=(${username}/${dockerhub_repo}:${tag_name})
#login to docker hub 
docker login --username=${username} --password=${passcode}
# pushing image to docker hub
docker push ${fullname}