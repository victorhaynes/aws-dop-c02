# AWS Systems Manager (SSM)
- Helps mangage a fleet of EC2 or On Prem systems at scale
- Easily detect problems
- Get operational insights
- Patching automation for enhanced compliance `EXAM`
- Works with Window and Llinux
- Integrated with AWS Config and CloudWatch
- Free, pay for what you use

# Features
Node Tools
- `Fleet Manager`
- Compliance
- `Inventor`
- `Hybrid Activations`
- `Session Manager`
- `Run Command`
- `State Manager`
- `Patch Manager`
- `Distributer`

Change Management
- `Automation`
- Change Calendar
- `Maintenance Windows`
- `Documents`
- Quick Setup

Application Tools
- Application Manager
- AppConfig
- `Parameter Store`
- `Resource Groups`

Operations Tools
- Explorer
- `OpsCenter`
- CloudWatch Dashboard

`EXAM` everything highlighted. Should be easy once you go through the topics

# Start EC2 Instances with SSM Agent - Hands On
- need to install SSM agent onto the server
- comes with Amazon Linux 2 AMI, Amazon Linux 2023, & some Ubuntu AMI
- If SSM not working with server it is probably an issue with the SSM agent

Note the EC2 instance needs the `AmazonSSMMangedInstanceCore` IAM role