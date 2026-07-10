# SSM Parameter Store
- Secure storage for configuration and secrets
- Optiona lseamless encryption using KMS
- Serverless, scalable, durable, easy SDK
- Version tracking of configuration / secrets
- Security through IAM
- Notifications with Amazon EventBridger
- Integration with CloudFormation

## SSM Parameter Store Hierarchy
/we/already/know/how/this/works

or

/we/already/know/how/that/might_be

can use `/aws/reference/secretsmanager/secret_ID_in_Secrets_Manger` to get Secrets Manager secrets through Parameter Store


or public parameters like
`/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2`

## Standard vs Advanced
- Advanced, small cost, TTLs supported, multiple policies  supported, larger size
- can do something like send a notification to EventBridge to notify expiration, or a lack of rotation