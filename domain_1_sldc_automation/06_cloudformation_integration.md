# CodePipeline - CloudFormation Integration
- Is a `deploy action` can be used to deploy AWS resources
- i.e. deploy lambda functions using CDK or SAM (alternative to CodeDeploy)
- Works with CloudFormation StackSets to deploy across multiple AWS accounts and AWS Regions
- Configure diff settings such as stack name, change set name, tempalte, params, iam role, action mode etc

### Example
- Inside CodePipeline pipeline:
- CodeBuild builds the app/CF yaml 
- `CREATE_UPDATE` mode - create or update an existing cloudformation stack
- CodeBuild tests the deployed test infra
- Deploy the real infra to prod

CloudFormation
[CodePipeline]

CodeBuild builds app -> Cloud Formatoin Deploys Infra & app -> CREATE_UPDATE -> mutates CF live stack

Cloud Formatoin Deploys Infra & app -> runs test suite on the stack via HTTP (functional, load testing etc)
![alt text](image.png)
-> If all passes then also deploy to Prod via `CREATE_UPDATE` action

## CF as target
CodePipeline /w CloudFormation as a Target:

`Action Modes`
- Create or Replace a Change Set, execute achange set
- create or update s tack, delte a stack, repalce a failed stack

`Template Parameter Overrides`
- Specify a JSON object ot override param values
- Can be an input artifact for CodePipeline
- can be static (recommended) or dynamic
- all params must be present in the template