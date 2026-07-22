# AWS X-Ray
- Visual analysis of our applications
- Tracing requests across your microservices (dsitributed systems)
- Integrations with 
    - EC2. isntall the X-Ray agent
    - ECS - agent r docker container
    - Lambda
    - Beanstalk autoamtically
    - API Gateway (good for 504s)
- The X-Ray agent or services need IAM permissions to X-Ray