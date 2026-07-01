# AWS CodePipeline Events vs Webhooks vs Polling

## Events
preferred way, AWS native
CodeComit event -> EvenTBridger -> trigger CodePipeline
default

For Github driven events we need to use `AWS
CodeStar Source Connection (Github App)` -> triggers CodePipeline

## Webhooks
Older way, HTTP endpoint
script sends a payload to Codepipeline on that webhook -> triggers codepipeline

## Polling
polls source/github, self explanatory
not reocmmended


## CodePipeline Action Types Constraints for Artifacts
Owner options:
- AWS for AWS services
- 3rd Party, Github or Alexa SKills Kit
- custom - Jenkins

Action Type
- Source - S3, ECR, GitHub
- Build - CodeBuild, Jenkins
- Test - CodeBuild, DeviceFarm, Jenkins
- Approval - Manual
- Invoke - Lambda, Step Functions
- Deploy - S3, CloudFormation, CodeDeploy, Elastic Beanstalk, ECS, Service Catalog

## `EXAM` - Manual Approval Stage
Owner is AWS
Action is Manual
Manual approval can trigger an SNS topic, approval relies on IAM permissions

Needs IAM USer Perm: `GetPipeline` and `PutApprovalResult` (must be able to see and mark result, so you need both)