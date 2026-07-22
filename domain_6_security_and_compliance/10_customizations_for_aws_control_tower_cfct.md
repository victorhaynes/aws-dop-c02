# Customizations for AWS Control Tower (CfCT)
- Framework for Control Tower
- GitOps-tyle customization framework created by AWS
- Helps you add customizations to your landing zone using your custom CF templates and SCPs
- automatcally deploy resources to new AWS accounts created using Account Factoy

- NOTE: CfCT is different from AFC 

CfCT: many CF tempaltes and SCPs

AFC: send 1 CF template

Both CfCT and AFC are on the `EXAM` in general

## Customizations for AWS Control Tower (CfCT)
Basically have CodeBuild invoke a step function that will deploy SCP to the ORG and StackSet to the managed accounts