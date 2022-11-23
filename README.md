# docker_and_aws_ecr_repo
demo created for docker and amazon ECR ( elastic conatiner registry0

command to use for Docker hub :
 step 1.) go to Ec2 instance ( attach permission as ec2 to ECR full access permission name --AmazonEC2ContainerRegistryFullAccess) having trust entity as EC2

 step 2.) copy the all file to ec2 instance

 step 3.) bash dockerhubpush.sh imagename tagname dockerhubrepo dockerusername dockerhubpassword

command to use for ECR hub :
 step 1.) go to Ec2 instance ( attach permission as ec2 to ECR full access permission name --AmazonEC2ContainerRegistryFullAccess) having trust entity as EC2

 step 2.) copy the all file to ec2 instance

 step 3.) bash docker_ecr-push.sh imagename Envirment aws_region