# CloudWatch Custom Metrics
- Possible to define your own metrics
- Push RAM, disk space, number of logged in suers etc
- Use API call `PutMetricData`
- Ability to use dimensions (attrs) to segment metrics
    - isntance.id
    - environment.name
- Can do standard per 60s, or high res 1/5/10/30s higher cost

- Important: accepts metric data points 2 weeks in the past and 2 hours in the future (make sure to configure your ec2 instance time correctly) `EXAM`
- and this is intended behavior to cover use cases

CLI docs are great here