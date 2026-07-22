# GuardDuty Advanced
- Can have multiple account strategy
- Associate the member accoutns with the Adminstrator account
    - through  an AWS org
    - sending invitation through guardduty
- Admin account can
    - add remove member accts
    - manage GD within the assocaited member accounts
    - maange finding, suppression rules, trusted IP lists, remediations

Note the Org admin does not have to be the GuardDuty admin, you can `delegate` that

## GD Findings Autoamted Response
- Findings are potential security issue for malicious events happening in your AWS account
- Autoamte resposne to security issues revelead by GD findings using EB
- Send alerts to SNS (email, lambda, slack, chime)
- Events are published to both the admin account nad the originating member cct

## GD Findings
- Pulls independent streams of data directly from CloudTrail (mgmt events, data events), VPC flow logs or EKS logs
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

Features:
- `trusted list`: do not generating findings
- `threat list`: known malicious IPs, either you came up with them or 3rd party threat intelligence did

in a multi account GD setup only the admin can manage this