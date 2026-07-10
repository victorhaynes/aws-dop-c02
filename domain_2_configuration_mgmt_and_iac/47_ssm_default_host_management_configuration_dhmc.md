# SSM Default Host Management Configuration (DHMC)
- when enabled, automatically. onfigures your EC2 instnaces as maanged instance without the use of EC2 instance profiles
- Instance Identity Role - a type of IAM Role with no permissions beyond identifying th EC2 isntance to AWS services (i.e. Systems Manager)
- EC2 instances must have IMDSv2 (not v1) enabled and SSM agent installed `exam`
- Automatically enables session maanger, patch maanger, inventory,auto updates awss ssm agent
- Per region basis


This only applies or `fleet management` tasks. It decides what `Systems Manager` can do