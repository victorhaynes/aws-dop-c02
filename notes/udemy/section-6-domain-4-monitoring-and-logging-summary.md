# Section 6: Domain 4 - Monitoring and Logging

## What this section covers

This section is the observability core: metrics, logs, alarms, agents, and query/analysis tooling.

## 1. CloudWatch Metrics

- CloudWatch publishes service metrics across AWS namespaces.
- Metrics have:
  - a namespace
  - dimensions
  - timestamps
- Dashboards let you visualize collections of metrics.
- Metrics can also be streamed near real time out of CloudWatch using `Kinesis Data Firehose`.

## 2. Custom Metrics

- Use `PutMetricData` to publish your own metrics.
- Typical custom-metric use cases:
  - memory usage
  - disk usage
  - business/application counters
- Key exam detail:
  - CloudWatch accepts custom metric timestamps up to `2 weeks in the past` and `2 hours in the future`
- High-resolution custom metrics support short periods like 1, 5, 10, or 30 seconds.

## 3. Anomaly Detection

- CloudWatch Anomaly Detection builds a learned normal baseline for a metric.
- It is useful when a static threshold is weak or noisy.
- Alarms can be based on anomaly bands instead of only hard-coded limits.

## 4. CloudWatch Logs

- Main building blocks:
  - `log groups`
  - `log streams`
  - retention policy
- Logs can come from:
  - applications
  - Lambda
  - ECS
  - Elastic Beanstalk
  - VPC Flow Logs
  - API Gateway
  - CloudTrail
  - Route 53
- Logs are encrypted by default and can use KMS.

## 5. Querying and shipping logs

### CloudWatch Logs Insights

- Query engine for historical log data.
- Useful for:
  - searching specific events
  - aggregations
  - saved queries
  - dashboards

### Export and subscriptions

- Batch export to `S3` uses `CreateExportTask`.
- For near-real-time delivery use subscription filters to:
  - `Kinesis Data Streams`
  - `Kinesis Data Firehose`
  - `Lambda`
  - downstream destinations like OpenSearch
- Cross-account log aggregation is possible with destinations, access policies, and the right IAM setup.

## 6. Metric Filters

- A metric filter turns matching log patterns into CloudWatch metrics.
- Good for counting things like:
  - `ERROR`
  - specific HTTP status codes
  - suspicious IP patterns
- Important exam note:
  - metric filters are not retroactive
  - only events after creation generate metric data
- Those metrics can then drive alarms.

## 7. Log types you should distinguish

### Application logs

- Produced by your application code.

### OS / system logs

- Produced by the host operating system.

### Access logs

- Produced by web servers, proxies, load balancers, and similar request-entry points.

### AWS-managed logs

- Examples include:
  - ELB access logs
  - CloudTrail logs
  - VPC Flow Logs
  - Route 53 query logs
  - S3 access logs
  - CloudFront access logs

This distinction matters because exam questions often test the right source for a given operational need.

## 8. CloudWatch Agent vs CloudWatch Logs Agent

- `CloudWatch Logs Agent` is the older logs-only agent.
- `CloudWatch Unified Agent` is the newer preferred option.
- Unified Agent can send:
  - logs
  - detailed host metrics such as RAM, processes, disk, and netstats
- Good practical point:
  - default EC2 monitoring does not give you rich memory metrics
  - the unified agent fills that gap

## 9. CloudWatch Alarms

- Alarm states:
  - `OK`
  - `INSUFFICIENT_DATA`
  - `ALARM`
- Alarm actions can target:
  - SNS
  - EC2 actions
  - Auto Scaling actions
- `Composite Alarms` combine other alarms with `AND` / `OR` logic to reduce noise.

## 10. EC2 recovery with alarms

- CloudWatch can alarm on EC2 status check metrics.
- Recovery-related metrics include:
  - system status
  - instance status
  - attached EBS status
- A recovery alarm can trigger EC2 instance recovery while preserving important identity/network characteristics better than simply replacing the instance.

## 11. Athena in the monitoring workflow

- Athena is useful when logs/metrics are exported into `S3` and you want SQL-style analysis without managing infrastructure.

## What to memorize for DOP-C02

- `PutMetricData` publishes custom metrics.
- Custom metrics can use timestamps in the past/future within the CloudWatch accepted window.
- `CloudWatch Logs Insights` is for querying historical logs.
- `CreateExportTask` is the batch-export path to S3.
- Subscription filters are the near-real-time streaming path.
- Metric filters are not retroactive.
- Unified Agent is preferred over the old Logs Agent.
- Composite alarms reduce noise by combining alarm states.

## Lecture map

- Lectures 171-173: Metrics, custom metrics, anomaly detection
- Lectures 174-180: Logs, Logs Insights, log types, agents
- Lectures 181-183: Alarms and Synthetics
- Lectures 184-185: Athena
