# ECS Auto Scaling
- AWS Application Auto Scaling

Can scale ECS tasks based on

- ECS Service Avg CPU Util
- ECS Avg Memory Util
- ALB Request Count per Target

`EXAM` only these 3 metrics

### Scaling Types
- Target Tracking - scale based on target value for those metrics
- Step Scaling based on a CW Alarm
- Scheudling Scalin

Remember ECS auto scaling != EC2 auto scaling/cluster node level

### Auto Scaling EC2 Instances
- Accomodate ECS Service Scaling by adding underlying EC2 Instance


- Auto Scaling Group Scaling
    - Scale your ASG bsaed on cpu util
    - add EC2 instance over time
- ECS Cluster Capacity Provider `for EC2 Launch types` `EXAM`
    - useds to automatically provision ands cale the infra for your ECS tasks
    - capacity provider paired with an ASG
    - add EC2 Instance when you're missing capacity (CPU, RAM)