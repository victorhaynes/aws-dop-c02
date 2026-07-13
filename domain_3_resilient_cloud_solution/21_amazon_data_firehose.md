# Amazon Data Firehose

Producers (applications, clients, SDK, Kinesis Agent, can pull directly from `Kinesis Data Streams`, `CloudWatch Logs & Events`, `AWS IoT`)
-> can do an optional Transformation with `Lambda` function -> Ingested by Amazon Data Fire Hose

Primary destinations are 
- S3
- Redshift
- Amazon OpenSearch

3rd party
- splunk
- Datadog
- mongodB
- New Relic

Custom
- HTTP Endpoint

#### Note
used to be called Kinesis Data Firehouse
- Fully Managed
- Automatic scaling, serverless, pay for what you use
- `near real time` `EXAM` keyword
- allows buffewring capability based on size/time
- Supports ioncoming CSV, JSON, Parquet, Avaro, Raw TEst, Binarydata
- Conversiosn ot Parquet / ORC, compressions with gzip/snapp
- Custom data transformations using AWS Lambda (ex: convert CSV to JSON before going to S3


# KDS vs ADF `EXAM` - make sure you understand this
KDS
- streaming data collection
- producer & consumer code
- real-time
- provisioned / on-demand mode
- datas torage 365 days
- replay capability

ADF
- Loading streaming data into S3/Redshift/OpenSearch/3rd Party/custom HTTP
- Fully managed
- Near real-time
- Automatic scaling
- No data storage
- Doesn't support replay capability