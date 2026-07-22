# AWS Config
- helps with auditing and recording compliance of our AWS resoruces
- helps recocd configurations and changes over time

Questions that can be solved by AWS Config:
- unrestricted SSH access to my SGs
- do my buckets hav any. publci access?
- how has my ALB config changed over times?
- per-region service
- can eb aggregateda cross regions and accounts

## Config Rules
- AWS manage rules over 75
- Define rules yourself using Lambda
    - ex. each dev tagged instance is an t2.micro
- Rules can be evalauted /triggered
    - for each config change
    - and / or: at regualr time intervals
- AWS Confi Rules does not prevent actions from happening (no deny)

- Pricing not free, but cheap

## Config Resource
- can view compliance over time
- configuration chanegs over time
- view of CloudTrail API calls for that resource

`EXAM` AWS Config cannot deny anything
- but you can setup `remediations`
- autoamted remediation actions for non-compliant resources
- Use AWS Managed Automation Documents or create custom Automation Documents
    - Tip: you can create Automation Documents that invokes Lambda function
- Can set up remediation retry times (N attempts)

## Config Rules Notifications
- Non compliant -> EB -> Lambda/SNS/SQS
- Can filter