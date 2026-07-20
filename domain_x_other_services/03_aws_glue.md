# AWSA Glue
- mnaged ETL service (Extract, transform, load)
- Useful to prepare and transform data for analytics
- Fully Serverless service
- Fully serverless service

S3 bucket/RDS EXTRACT -> Glue ETL does the trasform -> LOAD into Redshift data warehouse

## AWS Glue - Convert data into Parquet format
- `EXAM` this is important bc Paruqet is columnar and is more efficient to use with Athena on top of S3 for querying

S3 Put -> CSV -> use GLUE for ETL -> convert to Parquet -> target S3 bucket -> run Athena


To autoamte this you can put S3 event notifications to LAmbda and have Lambda or EventBridge invoke Glue

## Glue Data Catalog:
- catalog o datasets
- GLUE Data Crawler
    - S3
    - RDS
    - DynamodB
    - On-Prem JDBC database
- writes metadata to the `Glue Data Catalog` will ahve all the DB table metadata

Then Amazon Athena, Amazon Redshift Spectrum Amazon EMR rely on the Glue Data Catalog

## Glue `EXAM` high level
- `Glue Job Bookmarks`: preventsfrom re-processing old data
- `Glue DataBrew`: clean and normalzie data using pre-built transformation
- `Glue Studio`: GUI to create, run, monitor ETL jobs inGlue
- `Glue Streaming ETL`: biuilt on Apache Spark Structured Streaming, compatible with Kinesis Data Streaming, Kafa, MSK (managed KAfka)