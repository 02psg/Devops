#!/bin/bash
###############################################################################
# Author: Prince Singh Gaur
# Version: v0.0.1

# Script to automate the process of listing all the resources in an AWS account
#
# Below are the services that are supported by this script:
# 1. EC2
# 2. RDS
# 3. S3
# 4. CloudFront
# 5. VPC
# 6. IAM
# 7. Route53
# 8. CloudWatch
# 9. CloudFormation
# 10. Lambda
# 11. SNS
# 12. SQS
# 13. DynamoDB
# 14. VPC
# 15. EBS
#
# The script will prompt the user to enter the AWS region and the service for which the resources need to be listed.
#
# Usage: ./aws_resource_list.sh  <aws_region> <aws_service>
# Example: ./aws_resource_list.sh us-east-1 ec2
#############################################################################


##check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
    echo "Usage:./aws_resource_list.sh <aws_region> <aws_service>"
    echo "Example: ./aws_resource_list.sh us-east-1 ec2"
    exit 1
fi

#Assigning command line arguments to variables
AWS_REGION=$1
AWS_SERVICE=$2

#if aws cli is not installed, then exit the script
if ! command -v aws &> /dev/null
then
    echo "AWS CLI could not be found. Please install AWS CLI to use this script."
    exit 1
fi

#Executing aws cli command to list resources based on user input
Case $2
in
    ec2)
        aws ec2 describe-instances --region $AWS_REGION
        ;;
    rds)
        aws rds describe-db-instances --region $AWS_REGION
        ;;
    s3)
        aws s3 ls --region $AWS_REGION
        ;;
    cloudfront)
        aws cloudfront list-distributions --region $AWS_REGION
        ;;
    vpc)
        aws ec2 describe-vpcs --region $AWS_REGION
        ;;
    iam)
        aws iam list-users --region $AWS_REGION
        ;;
    route53)
        aws route53 list-hosted-zones --region $AWS_REGION
        ;;
    cloudwatch)
        aws cloudwatch list-metrics --region $AWS_REGION
        ;;
    cloudformation)
        aws cloudformation describe-stacks --region $AWS_REGION
        ;;
    lambda)
        aws lambda list-functions --region $AWS_REGION
        ;;
    sns)
        aws sns list-topics --region $AWS_REGION
        ;;
    sqs)
        aws sqs list-queues --region $AWS_REGION
        ;;
    dynamodb)
        aws dynamodb list-tables --region $AWS_REGION
        ;;
    ebs)
        aws ec2 describe-volumes --region $AWS_REGION
        ;;
    *)
        echo "Unsupported AWS service. Please enter a valid service."
        exit 1
        ;;
esac    

exit 0
###############################################################################
# End of Script
###############################################################################
