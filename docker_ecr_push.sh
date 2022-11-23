#!/bin/bash
image=$1
SDLC_ENV=$2
Region=$3
echo "value of Images is " $image
if [ "$image" == "" ] 
 then
 echo "Usage: $0 <image-name> not specified"
    exit 1
fi
#account number specified
account=$(aws sts get-caller-identity --query Account --output text)
if [ $? -ne 0 ]
 then
    exit 255
fi

ecr_repo_name=$image"-ecr-repo"
image_name=$SDLC_ENV-$image
echo "Checking ECR Repo with name $ecr_repo_name"
#checking ecr repo is existed or not
aws ecr describe-repositories --repository-names ${ecr_repo_name} --region $Region || aws ecr create-repository --repository-name ${ecr_repo_name} --region $Region 
#login to ecr
aws ecr get-login-password --region ${Region} | docker login --username AWS --password-stdin ${account}.dkr.ecr.${Region}.amazonaws.com
docker build -t ${image_name} .
fullname="${account}.dkr.ecr.${Region}.amazonaws.com/${ecr_repo_name}:$image_name"
echo "fullname is $fullname"
#tag
docker tag ${image_name} ${fullname}
# pushing images
docker push ${fullname}

if [ $? -eq 0 ]
 then 
 echo "images pushes to ${ecr_repo_name} is sucessful"
 else 
 echo "images pushes to ${ecr_repo_name} is unsucessful"
fi