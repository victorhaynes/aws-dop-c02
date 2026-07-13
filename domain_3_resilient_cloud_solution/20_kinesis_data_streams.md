# Amazon Kinesis Data Streams
- Colelct and store streaming data in real-time `EXAM` (keyword: real time, click streams, IoT, metric & logs)

Producers
- code you write on an application
- or install a `Kinesis Agent` on your server

-> Data will get sent in real time to `Amazon Kinesis Data Streams`

Consumers
- application
- lambda
- Amazon Data Firehose
- Managed Service For Apache Flink

### Features
- Rtention up to 365 days
- Can reprocess (replay) dta by conumer
- Dta can't be deleted from Kinesis (until it expires)
- Data up to 10MiBtypical use case is a lot of small real time data
- Data ordering guaranteee for data with the same Parition ID
- At rest KMS ecryption, in-flight HTTPS encryption
- `Kinesis Producer Library` to write an optimzied producer application
- `Kinesis Client Library` to write an optimized consumer application


## Capacity Modes
- Provisioned Mode
    - choose number of sahrds
    - each shard gets 1MB/s (or 1000 records per second)
    - Each shard gets 2MB/s out
    - i.e. 10,000 or 10MiB/s need 10 shards
    - scale manually to increase or decrease the number of sahrds
    - you apyper shard provisioned per hour
- On-demand mode:
    - no need to provision or mange the capacity
    - default capacity provisioned (4MB/s in or 4000 records per second)
    - Scales autoamtically based on observed throughput during last 30 day peak
    - Pay per stream per hour & data in/out per GB
