# AWS Config Conformance Packs
- collection of AWS Config Rules and Remediation actions
- Packs are created in YAML format (ismialr to CloudFront)
- Deplyo to an AWS account and regions or across an AWS Org
- Pre-built sample PAcks or create your own Custom Conformance Packs
- Can incldue custom Config Rules which are backed by Lambda functions to evalaute whether your resoruce are compliant with config rules
- Can apss inputs via parameters section to make it more flexible
- Can desginate a Delegate Administrator to deploy Conforamnce Packs to your AWS Organization (can be Member account)

## AWS Config - Confrmance Pack
- TLDR: The CloudFormation of Config Rules
- `Parameters` & `Configiration Rules`

## AWS Config - Conforamnce Pack - CICD
- PAcks checked into CodeCommit
- CodeBuild will manage the deployment (Config Managed Rules, Config Custom Rules (Lambda), SSM Automations For Remediations)-> CF

`EXAM` revisit this