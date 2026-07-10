# SSM Session Manager with VPC Endpoints
How to get SM to connect to private EC2 instances (no public internet action)

need
1. `SSM Service` itself needs to allow 443 inbound on the SG within the private subnet

2. `SSM Session Manger` needs 443 inbound also 

3. On EC2 Instance alow outbound 443 to these services

Then for the actual VPC Interface Endpoint
for KMS or CLoudWatch logs we create the VPC endpoint for that service

For S3 we can use VPC Gateway Ednpoint for S3 (need to update route tables)


`EXAM` need appropriate VPC endpoints to allow EC2 instance to connect privately