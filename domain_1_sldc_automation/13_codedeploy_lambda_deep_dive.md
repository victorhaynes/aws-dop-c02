## CodeDeploy Deployment to Lambda
- Create a new Lambda function version and want to deploy it
- Specify the version info in the `appspec.yml`
- CodeDeploy updates a lambda function with the new lambda function
- `CodeDeploy Agent NOT required` -- which makes sense

## Content of Lambda's AppSpecy.yml
- Name
- Alias
- CurrentVersion
- TargetVersion
```yml
version: 0.0
Resources:
  - myLambdaFunction:
      Type: AWS::Lambda::Function
      Properties:
        Name: "my-payment-processor"
        Alias: "live"
        CurrentVersion: "1"
        TargetVersion: "2"
```
## CodeDeploy Deployment to Lambda
1. Developer pushes code
2. CodePipeline's CodeCommit triggers CodeBuild
3. CodeBuild deploys new Lambda Function
4. Codebuild creates appspec.yaml
5. CodeBuild puts `appspec.yml` in S3 bucket
6. CodeDeploy takes the `appspec.yaml` and uses it to deploy on alias & shift traffic in Lambda

## CodeDeploy Deployment to Lambda
- Blue-green deployment only for Lambda deployment
- Canary, Linear, All at Once
- more of 100% - X% pattern

## Lambda Deployment Hooks
only 3 hooks

Start
1. [BeforeAllowTraffic]
2. AllowTraffic
3. [AfterAllowTraffic]

End