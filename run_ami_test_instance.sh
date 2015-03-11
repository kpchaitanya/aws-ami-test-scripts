#! /bin/bash
set -e

if [ $# -ne 1 ]; then
  echo "Usage: $0 [ami_id]"
  exit 1
fi

IMAGE_ID=$1

echo "Using AMI with ID '$IMAGE_ID'"
IMAGE_NAME=$(aws ec2 describe-images --image-ids $1 --query "Images[0].Name" --output text)
echo "AMI Name: '$IMAGE_NAME'"

echo ""
echo "__ Starting new instance from AMI __"
INSTANCE_ID=$(aws ec2 run-instances --cli-input-json "$(cat skeleton.json)" --associate-public-ip-address --image-id $IMAGE_ID --query "Instances[0].InstanceId" --output text)

echo "Assigning a name tag to instance '$INSTANCE_ID'"
INSTANCE_NAME='AMI Demo Test'
aws ec2 create-tags --resources $INSTANCE_ID --tags "Key=Name,Value=$INSTANCE_NAME"
echo "It is now called '$INSTANCE_NAME'"

echo "Waiting for '$INSTANCE_ID' to become available"
aws ec2 wait instance-running --instance-ids $INSTANCE_ID
INSTANCE_PUB_IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[0].Instances[0].PublicIpAddress" --output text)

echo ""
echo "__ Test instance up and running __"
echo "Instance ID: '$INSTANCE_ID'"
echo "Public IP: '$INSTANCE_PUB_IP'"
