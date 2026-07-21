# DynamoDB Advanced Features

### DynamoDB Accelerator (DAX)
- Managed highly avail, seamless in-memory cache for dynamoDB
- Help solve read congestion by caching
- `microsecond` latency for cached data
- `no code changes required` unlike elasticache on top of RDS or some other database

If you want to store aggregtation results like a computation result then ElastiCache is a good choice

## DyamoDB Stream Processing
- Ordered stream of item-level modification (crud) in a table
- Use Cases
    - real time reaction (welcome email)
    - real time usage analytics
    - insert derivative tables
    - implement cross-region replication
    - invoke AWS lambda changes to your dynamoDB table

Stream Processing
### DynamoDB Streams
- 24 hours retention
limited # of consumers
- process using AWS Lmbda Triggers or DynamoDB Stream Kinesis Adapter
- `EXAM`

### Kinesis Data Stream
- 1 year retention
- high number of consumers
- Process using AWS Lambda, Kinesis Data analytics, KDF/ADF, Glue Streamin ETL

### DynamoDB Global Tables
- make a dynamoDB tabel ccessible with low latency in multiple regions
- active-active replication
- applications can READ and WRITE to the table in any region
- must enable DynamoDB Streams as a pre-req
- `EXAM`

### DynamoDB TTL
- auto delete an item after expiry timestamp `ExpTime (TTL)` in an epoch timestamp
- expire then evenually delete
- good for web sessions, regulatory obligations, only current items `EXAM`

### DynamoDB for DR
- `continuous backup with PITR`
- Optionally nebaled for last 35 days
- pick anytime in the window
- recovery creates new table

- `On-demand backups`
- full backups forl ong-term retention untl explicitely deletd
- Doesn't affect perfomance or latency
- Can be configured and managed in AWS Backup (enables cross-region copy)
- The recovery process creates a new table

### Integration with S3
Export to S3 (must enable PITR)
- Works for ny point of time in the last 35 days
- Doesn't affect the read capacity of your table
- Perform data analysis on top of DynamoDB
- Retain snapshots for auditing
- ETL on top of S3 data bbefore importing back into DynamoDB
- Export in DynamoDB JSON or ION format

Import from S3
- CSV, DynamoDB JSON or ION format
- does not consume write capacity
- creates new table
- import errors logged in cloudwatch logs

