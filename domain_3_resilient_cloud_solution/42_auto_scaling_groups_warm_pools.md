# Auto Scaling Groups Warm Pools

## Scale out Latenchy Problem
- want to launch as fast as possible during ASG
- some init/bootstrap is unavoidable
- historicalyyou over-provision to absorb unexpected demand increase or use overloaded Golden Iamge to reduce boot time

new solution
## Warm Pools
- Reduces scale-out latency by maintaing a pool of pre-init instances
- state is either staretd, stopped, or hibernated
- duing scale out warm pool instance -> live ASG

Warm Pool Size Settings
- minimum warm pool size (always in the warm pool)
- max prepared capacity = Max capacity of ASG (default)
- Or Max prepared capacity = Set number of isntances
- Warm Pool Instance State - what state to keep your Warm Pool instances in after init (running, stopped, hibernated)
- Warm pools dont contribute to ASG metrics

### ASG - Warm Pools Pricing: m5.large
- If we "over provision EC2" in an ASG
- Pay for running cosst i.e. $69.12 a month
- If the EC2 instance is in `stopped` state then we only pay or the EBS volume i.e. $1.00 a month

### Stopped vs Hibernated
`Running`
- scale out delay: faster 
- start up delay: lower
- costs: higher

`Stopped`
- scale out delay: slower
- start up delay: slower (ram is lost)
- costs: lower 

`Hibernated` (usually hwat you want for ASG cost savings)
- scale out delay:  medium
- start up delay:  medium (ram is maintained, faster than "stopped")
- costs: lower

### ASG Warm Pools Insttance Reuse Policy
- By default ASG termiantes isntances when ASG scales in, then it launcehs new instance into the Warm Pool
- Instance Reuse Policy allows you to return isntances to the Warm Pool when a scale-in event happens

### Lifecycle Hooks
- must use if you want to use Warm Pools
