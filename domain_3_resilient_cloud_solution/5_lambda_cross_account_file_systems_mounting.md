# AWS Lambda Cross-Account File Systems Mounting
Cross acount EFS mounting

Assume 2 diff accounts, 2 different VPCs

1. must establish VPC peering
2. can lambda function have the IAM perms to describe the EFS system in the other account/vpc
3. in the EFS vpc we have to allow the other account's principal to do XYZ