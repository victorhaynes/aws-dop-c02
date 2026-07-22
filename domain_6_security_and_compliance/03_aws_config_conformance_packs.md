# AWS Config Conformance Packs
- collection of AWS Config Rules and Remediation actions
- Packs are created in YAML format (similar to CloudFront)
- Deploy to an AWS account and regions or across an AWS Org
- Pre-built sample Packs or create your own Custom Conformance Packs
- Can incldue custom Config Rules which are backed by Lambda functions to evalaute whether your resoruce are compliant with config rules
- Can pass inputs via parameters section to make it more flexible
- Can desginate a Delegate Administrator to deploy Conformance Packs to your AWS Organization (can be Member account)

## AWS Config - Conformance Pack
- TLDR: The CloudFormation of Config Rules
- `Parameters` & `Configiration Rules`

## AWS Config - Conformance Pack - CICD
- Packs checked into CodeCommit
- CodeBuild will manage the deployment (Config Managed Rules, Config Custom Rules (Lambda), SSM Automations For Remediations)-> CF

`EXAM` revisit this