# EC2 Image Builder
- used to automate the creation of VM or container images
- free, only pay for underlying EC2 services
- Can create AMIs
- can publish AMI to multiple regions and multiple accounts

EC2 Image Builder-> uses Builder EC2 Instance -> creates New AMI -> Test EC2 instance gets spun up -> then AMI can be distributed

# Image Builder CICD Architecture

[CodePipeline]
- Stage 1 Build Code

AWS CodeCommit, AWS CodeBuild

- Stage 2 Build AMI

Cloud Formation -> EC2 Image Builder -> new AMI

- Stage 3 Roll out

AWS CloudFormation -> rolling update to an ASG -> ASG instances will use the new AMI

## Extras: Share using RAM
- Use AWS Resource Access Manger, to share Images, Recipes, and Components across AWS accounts or through AWS Organization

## Tracking the latest AMI
- store the ID of the latest AMI in SSM Parameter Store

EC2 Iamge Builder -> SNS -> Lambda -> SSM Param Store

Users or CloudFormation can then reference the new ID manually or dynamically