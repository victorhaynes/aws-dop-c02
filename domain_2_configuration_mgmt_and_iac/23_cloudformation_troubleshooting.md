# CF Troubleshooting `EXAM`
- `DELETED_FAILED` stack deletion failed. Some things must be emptied before deleting such as S3. Use a Custom Resource with Lambda Function to automate some actions. you also cannot delete a security group if other EC2 instances are using it
- Can use DeletionPolicy=Retain to skip deletion

- `UPDATE_ROLLBACK_FAILED`
- could be caused by manual changes, insufficient ASG signals, insufficient IAM permissions

# CF StackSet Troubleshooting
- `OUTDATED` stack operation failed, stack instance status is outdated
- I.e. insufficient perms in target account for creating the resources
- S3 bucketnames that are not unique
- Admin account missing trust relationship with the target
- A limit or quota in a target account (too many resources)
- Can be harder to troubleshoot

# CF Troubleshooting
- Cannot set an EC2 instance private DNS name in a CloudFormation template (there's no PrivateDnsNameAttribute) `EXAM`
- Nor can you set anything that you cannot do in the AWS Console
- If your CloudFormation template works in one Region and doesn't work in another Region
- Check if AWS services in the template are vailable in this Region
- Check AMI IDs
- Check hardcoed region-specific values
- Check unique names for resource that require unique names