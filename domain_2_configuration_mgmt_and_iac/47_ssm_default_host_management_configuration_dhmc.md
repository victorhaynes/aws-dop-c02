# SSM Default Host Management Configuration (DHMC)
- when enabled, automatically, configures your EC2 instances as maanged instance without the use of EC2 instance profiles
- Instance Identity Role - a type of IAM Role with no permissions beyond identifying the EC2 instance to AWS services (i.e. Systems Manager)
- EC2 instances must have IMDSv2 (not v1) enabled and SSM agent installed `exam`
- Automatically enables session maanger, patch maanger, inventory, auto updates AWS ssm agent
- Per region basis


This only applies `fleet management` tasks. It decides what `Systems Manager` can do