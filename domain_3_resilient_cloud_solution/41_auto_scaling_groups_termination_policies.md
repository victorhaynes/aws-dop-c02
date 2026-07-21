# Auto Scaling Groups Termination Policies
- Determine which instances to termiante first during scale-in events, instance refresh, and AZ rebalancing

- Default termination Policy
    - select az with more instances
    - termiante instance with oldest launch template or launch configuration
    - if instances were launched using the same launch template, termiante the instance that is closest to the next billing hour

1. Oldest launch template or launch config
2. Closest to next billing hour

## Policies
- `Default` (above)
- `AllocationStrategy` - terminate to align with the allocation strategy (spot instances, lower priority on-demand isntances)
- `OldestLaunchTemplate` 
- `OldestLaunchConfiguration`
- `ClosestToNextInstanceHour`
- `NewestInstance`
- `OldestInstace` (termiantes the oldest isntance, upgrading instance size, not launch template)

You can use one or more policies and specify the evaluation order