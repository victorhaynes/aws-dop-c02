# GuardDuty Advanced
- Can have multiple account strategy
- Associate the member accoutns with the Adminstrator account
    - through  an AWS org
    - sending invitatio nthrough guardduty
- Admi naccount can
    - add remove member accts
    - maange GD within the assocaited member accounts
    - maange finding, suppression rules, trusted IP lists, remediations

Note the Org admin does not have to tbe the GuardDut admin, you can `delegate` that

## GD Findings Autoamted REsponse
- Findings are potential security issue for malicious events happening in your AWS account
- Autoamte resposne to security issues revelead by GD findings using EB
- Send alers to SNS (email, lmbda, slack, chime)
- Events are published to bot hthe admin account nad the originating member cct

## GD Findings
- Pulls independent streams ofd ata directly from CloudTrail (mgt events data events), VPC flow logs or EKS logs
    - will get this data itself OOTB
- Each finding has a severity to 0.1 to 8+ High/Medium/Low
- Can generate sample findings in GD to test your automations

## Finding Types
EC2
- Bruteforce EC2 access,crypto attack

IAM Finding Types
- CloudTrail logging disabled, root credential usage
etc

## GD trusted and Threat IP Lists
- works only for public IP address
- trusted list: do not generating findings
- threat list: known malicious IPs, either you came up with them or 3rd party threat intelligence did

- in a multi account GD setup only the admin can maange this