#version:v1
#
#This script will report the aws usage
#
#
##Author- Pushpak
#
#AWS S3
#AWS EC2
#AWS Lambda
# AWS IAM users
#

set -x

output_file="new.txt"
echo "print the no of bucket in s3" |  tee -a $output_file

aws s3 ls | tee -a $output_file

echo "print the no of ec2 machine details" |  tee -a $output_file

aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' | tee -a $output_file

echo "print the no of lambda functions" |  tee -a $output_file

aws lambda list-functions | tee -a $output_file

echo "list the no of IAM users" |  tee -a $output_file

 aws iam list-users | jq '.Users[] | {UserName: .UserName, UserId: .UserId}' | tee -a $output_file


