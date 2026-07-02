# CodeDeploy Deployment to ECS
- Automatically handles a deployment of a new ECS Task Definition to an ECS Services
- Only support Blue-Green and the service must be conencted to a Load Balancer
- The `ECS Task Defintion` and new container `images` *must be already created*
- the `appsec.yml` file must live in S3

# CodeDeploy Deployment to ECS
1. Developer pushes code
2. CodePipeline's CodeCommit triggers CodeBuild
3. CodeBuild pushes image to ECR
4. Codebuild creates ECS Task definition in ECS Registry
5. CodeBuild puts `appspec.yml` in S3 bucket
```yml
version: 0.0
Resources:
  - TargetService:
      Type: AWS::ECS::Service
      Properties:
        TaskDefinition: "arn:aws:ecs:us-east-1:123456789012:task-definition/my-ecs-task:1"
        LoadBalancerInfo:
          ContainerName: "web-app"
          ContainerPort: 80
```

## CodeDeploy - Deployment to ECS
- you can shift traffic to the new Task Set using Canary, Linear, or All At Once
- More of the 100% - X% pattern
- Can also define a second ELB Test Listener to test the replacement (green) version before traffic is rebalancd

## CodeDeploy - ECS Deployment Hooks
- cannot use scripts, hooks must be Lambda functions `EXAM`

Start
1. [BeforeInstall]
2. Install
3. [AfterInstall]
4. AllowTestTraffic
5. [AfterAllowTestTraffic]
6. [BeforeAllowTraffic]
7. AllowTraffic
8. [AfterAllowTraffic]

End