# SSM Automations
- simplifies common maintenance and deployment tasks of EC2 instances and other AWS resource
- Example restart instance, create an AMI, EBS, snapshot

Automations our OUTSDE the instance, Run Command inside the instance

- Automation Runbook
    - SSM documents of type automation
    - defines actions preformed on EC2 instances or aWS resources
    - pre-defined runbooks (AWS) or create cuswtom runbooks
- can be triggered
    - manually, cli, sdk, event bridger
    - on a schedule using Maintenance Windows
    AWS Config remediation rules