#!/bin/bash

# This script is for ssh-ing into the cloud9 instance.
instance_id=$(terraform output -raw cloud9_instance_id)
instance_ip=$(terraform output -raw cloud9_public_ip)

aws ec2 start-instances --instance-id $instance_id --output json --no-cli-pager

for i in {0..24..1} 
do
  current_state=$(aws ec2 describe-instances --instance-ids ${instance_id} --output json --no-cli-pager | jq -r '.Reservations[0].Instances[0].State.Name')
  [[ ${current_state} == "running" ]] && ping -c 1 $instance_ip && [[ "$?" == "0" ]] && break
  echo "INFO: Waiting for instance to be ready ..."
  sleep 5
done
sleep 5
ssh ubuntu@${instance_ip}
