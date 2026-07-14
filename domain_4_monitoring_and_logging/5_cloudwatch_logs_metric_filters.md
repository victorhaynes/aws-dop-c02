# CloudWatch Logs Metric Filters
- CW Logs can use fitler expressions
    - for example find an IP
    - count occurences of a string inyour logs
    - metric fitlers can be used to trigger alarms
- Filters do not retroactively filter data. Filters only publish the metric data points for events that happened after creation
- Ability specify up to 3 dimmensions
- Integrates with CW Alarms/SNS