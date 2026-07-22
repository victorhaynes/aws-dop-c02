# AWS Control Tower Account Factory and Migrating Accounts

## Account Factory Customization (AFC)
- autoamatically customize resources in new and existing acconts created through account factory
- Custom Blueprint
    - CF template that defiens the resources and configs you want in the account
    - Define in the form on a Service Catalog Poduct
    - Stored in a Hub-Account, which stores all the Custom Blueprints (recommended: don't use the mgmt account)
    - also available pre-defined blueprints created by AWS partners
- `only one blueprint can be deployed to the account`

## Account Factory
- can react to new accounts created using eventbridge, i.e. invoke SNS or lambda

## Migrate an AWS Account to Control Tower
- Define a target OU
- move account to an unregistered OU
- Create an IAM role that allows Control tower the manage the account with `AWSControlTowerExecution`
 