# Amazon CloudWatch Metrics
- CW provides metrics for every service in AWS
- Metrics are variables to monitor (CPUUtilizaiton, NetworkIn)
- Metrics belong to namespaces
- Dimension: is an attr of a metric (instance id, environment etc)
- Up to 30 dimensions per metric
- Metrics have timestamps/time based
- When you have emtrics you can amake a dashboard
- Can make custom metrics (memory usage is the big one )

# CW Metric Streams
- Can stream near real-timedelivery and low latency outside of CW to a destination
    - Amazon Kinesis Data Firehose
    - 3rd party service provider: datadog, dynatrice, new relic, splunk, sumo logic etc

CW -> Kinesis Data Firehose -> S3->Athena/Redshift/OpenSearch

- Option to filter metrics only to a subset of them