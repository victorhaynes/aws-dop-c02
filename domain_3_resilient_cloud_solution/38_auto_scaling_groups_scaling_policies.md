# Auto Scaling Groups Scaling Policies
- Dynamic Scaling
    - Target Tracking Scaling
        - Simple to setup
        - Ex. avg Cpu UTIL at 40%
    - Simple / Step Scaling
        - Based on `CloudWatch Alarms` (i.e. CPU > 50% +)
    - Scheduled Scaling
        - self explanatory

- Predictive Scaling
    - continuously forecast load and schedule scaling ahead based on a forecast
        - good for cyclical data

### Good Metrics to scale on
- CPUUtilization (avg across instances)
- RequestCountPerTarget
- AverageNetowrk In/Out
- Any custom metric you push to cloudWatch

### Scaling Cooldowns
- after a scaling activity happens you are in the cooldown period (default 300s/5mins)
- During cooldown period the ASG will not launch or terminate aditional instances (to allow for metrics to stabilize)
- Advice: use aready-to-use AMI to reduce configuration time in order to be serving requests faster and reduce cooldow period

revist for your own project, not a bad idea to make an AMI or explore it