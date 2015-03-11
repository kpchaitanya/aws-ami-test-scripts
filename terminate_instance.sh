#! /bin/bash
set -e

if [ $# -ne 1 ]; then
  echo "Usage: $0 [instance_id]"
  exit 1
fi

INSTANCE_ID=$1

#echo "Terminating instance"
aws ec2 terminate-instances --instance-ids $INSTANCE_ID > /dev/null #pssst

# we could wait for the termination to finish
#echo "Waiting for the late instance"
#aws ec2 wait instance-terminated --instance-ids $INSTANCE_ID

echo "RIP '$INSTANCE_ID'"
