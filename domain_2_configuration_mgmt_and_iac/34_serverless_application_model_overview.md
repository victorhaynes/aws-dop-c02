# AWS SAM
- Framework for developing and deploying serverless applications
- All the configuration is YAML code
- Generate complex CloudFormation from simple SAM YAML files
- Supports anything from CloudFormation: Outputs, Mappings, Parameters, Resources
- SAM can use CodeDeploy to deploy Lambda functions
- SAM can help you to run Lambda, API Gateway, DynamoDB locally

## AWS ASM Recipie
`Transform Header` indicates it's a SAM template
`Trasnform: 'AWS::Serverless-2016-10-31`

Write Code:
- AWS::Serverless::Function/Api/SimpleTable

Pakage and deploy `sam deploy` or `sam package

## Deep Dive into SAM Deployment
SAM Template -> CloudFormation -> zip & upload to S3 -> create/execute ChangeSet

## SAM Accelerate (sam synx)
`sam sync`
- Reduce latency while deploying resource to AWS
- uses the service APIs directly, bypassing CloudFormation

Sam Sync (no option)
- synchronize code and ifnrastructure

sam sync --code
- synchornize code changes without updating ifnrastructure (bypass CloudFormation, update in seconds)

sam sync --code --resource AWS::Serverless::Function
- synchronize only  all lambda functions

sam sync --code --resource-d <SOME_FUNCTION>

sam sync --watch
