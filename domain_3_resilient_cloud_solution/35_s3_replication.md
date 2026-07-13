# Amazon S3 Replication

CRR and SRR (cross region rep vs same reigon rep)
- Must enable versioning in source and destination buckets
- buckets can be in different AWS accounts
- copying is asynchornous
- Must give proper IAM permissions to S3
- Use cases:
    - CRR - compliance, lower latency access, replication across accounts
    - log aggregation, live replicationn  between prodution and test accounts


By default delete markers are not replicated `EXAM` you can turn this on if you want to