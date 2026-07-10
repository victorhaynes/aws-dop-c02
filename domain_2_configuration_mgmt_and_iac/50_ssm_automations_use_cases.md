# SSM Automations Use Cases
- Reduce costs by auto start/stop EC2 and RDS instance
- Can use EventBrdge i.e. 9am start QA server at 5pm turn it off

- Build a golden AMI (but EC2 Image builder is probably the better solution)

Automations re tightly integrated with AWS Config, for example if a S3 bucket does not have versioning a remediation action can renable-versioning