# CloudWatch Agent and CloudWatch Logs Agent

### CW Logs for EC2
- no EC2 logs go to CW Logs by default
- need to start CW Agent to push the log files you want
- Make sure IAM permissions are correct
- The CW Log Agent can be setup on-prem too

### CW Logs Agent & Unified Agent
- For virtual servers (EC2 instance, on-prem servers)
- CW logs agent
    - old version of teh agent
    - can only send to CW logs
- CW Unified Agent
    - can do metrics and logs
    - easy configuration using SSM parameter store
    - collect additional system level metrics such as RAM

`REVISIT` for personal use case, am I using the unified agent or the old one currently? if the Unified agent provides RAM then use that

## CW Unified Agen Metrics
- collected directly on your linux server / EC2 instance
- CPU
- Disk mtrics
- RAM
- Netstat
- Processes
- Swap space

Out of the box (unlike logs) for EC2 you get disk, cpu, network metrics. If you want more than that you need the CW unified agent