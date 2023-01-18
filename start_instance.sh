#!/bin/bash

# This script starts the cloud9 instance.

aws ec2 start-instances --instance-id $(terraform output -raw cloud9_instance_id)
