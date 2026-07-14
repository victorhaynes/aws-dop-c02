# Amazon Athena
- Serverless query service to analyze data stored in S3
- Uses standard SQL (built on Presto) to query the files
- Without moving the data
- Supports CSV, JSON, ORC, Avro and Parquet
- Pricing $5.00 per TB of data scanned
- Commonly used with Amazon Quicksight for reporting/dashboards
- Use cases: Businessi ntelligene / analytics /reporting, analyze & query VPC flow logs, ELB logs, CloudTrail trals etc as long as they are in S3
- `EXAM` - serverless SQL enine for S3 analysis

## `EXAM` ATHENA PErforamnce Improvement
- Use columnar data for cost-savings (less scan)
    - recommended tou use Apaache Parquet or ORC is reocmmended
    - Huge performance
    - Use Glue (ETL) to convert your data to Parque o ORC (CSV -> Parquet)
- Compress data for smaller retrievals (i.e. zip)
- Partition data sets in S3 for easy querying on virtual columns
    - i.e. using `/` path names like namesapces
    - ex. `s3://athena-examples/flight/parquet/year=1991/month=1/day=1`
- use larger files to minimize overhead (larger files instead of many small files, >128MB)

## Athena Federted Query
- Can query data anywhere in realtional, non-relational object,custom data sources (AWS or on-prem) run SQL anywhere
- Uses `data soruce connector` that runs on AWS LAmbda to run Federated Queries (e.g., CW Logs, DynamoDB, RDS)
