# Application Auto Scaling
- Monitors your aps and automatcally adjusts capacity to maintain steady, predictable perfomance at a lowest cost
- Setup scaling for multiple resources across multiple services ro ma single place
- Point to your app and select the services and resoruces you want to scale(no need to setup alarms or scaling actions for each service)
- Search for resources/services using `CloudFormation Stack`, `Tags`, or `EC2 ASG`
- Build `Scaling Plans` to autoamtically add/remove capacity from your resources in real-time as demand changes
- Supports Target Tracking, Step, and Scheduled Scaling Policies

### AWS Application Auto Scaling
covers a lot of things
- aurora replicas
- dynamodb table capacity
- ECS
- lamda provisioned concurrency
- ASGs
- ec2 spot fleet
