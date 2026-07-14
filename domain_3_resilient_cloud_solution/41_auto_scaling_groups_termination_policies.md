# Auto Scaling Groups Termination Policies
- Determine which isntances to termiante first during scale-in events, instance refresh, and AZ rebalancing

- Default termination Policy
    - select az with more instances
    - termiante instance with oldest launch template or launch configuration
    - if instances were launched using the same launch template, termiante the instance taht is closest to the enxt billing hour

1. Oldest launch template or launch config
2. closest to next billing hour

## Policies
- Default (above)
- AllocationStrategy - terminate to align with the allocation strategy (spot instances, lower priority on-demand isntances)
- OldestLaunch Template
- OldestLaunchConfiguration
- ClosestToNextInstanceHour
- NewestInstance
- OldestInstace (termiantes the oldest isntance, upgrading instance size, not launch template)

You can use one or more policies and specify the evaluation order