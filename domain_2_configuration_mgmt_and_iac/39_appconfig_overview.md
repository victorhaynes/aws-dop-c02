# AWS AppConfig
- Configure, validate, deploy dynamic configurations
- Deploy dynamic config changtes to your applications independently of any code deployments
    - you don't need to restart the application
- Feature flags, application tuning, allow/block listing
- Useful for EC2, Lambda, ECS, EKS
- Gradually deploy the configuration changes and rollback if issues occur

AppConfig
- Parameter Store
- SSM Documents
- S3 Bucket

- Van validate config changes before deployment using JSON or Lambda