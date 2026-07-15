# EC2 Instance Status Checks
- Autoamtic checks AWS performs to identify hardware and software issues

- `System Status Check`
    - monitor problems with AWS systems (software/hardware issues on the physical host, loss of system power)
    - check personal health dashbaord fra ny schedueld critical maintenace by AWS to your instance's host
- `Instance status checks`
    - monitors software/network configuration of your instance
    - `resolution`: reboot the instance or change instance configuration
- `Attached EBS status check`
    - `monitors` EBS volumes attached to your instance (reachable & complete I/O operations)
    - `resolution`: reboot the isntance or replace affected EBS volumes

## Status Checks - CW Metrics & REcovery
- CloudWatch Metrics (1 min interval)
    -StatusCheckFailed_System
    -StatusCheckFailed_Instance
    -StatusCheckFailed_AttachedEBS
- Option 1: CloudWatch Alarm
    - recover EC2 instance with the same private/public IP, EIP, metadata, and placement group
    - send notifications using SNS
- Option 2: auto scaling group
    - set min/max/desired 1 to recover an instance but won't keep the same private and elastic IP

    # Hands On
    - Create a CW alarm from the EC2 console and use an OOTB `Recover, Reboot, Stop, Terminate` remediation action
    - And set a threshold/condition i.e. system failure for 5 minutes