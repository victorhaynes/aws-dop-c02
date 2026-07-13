# AWS Database Migration Service (DMS)
- Quickly and securely migrate databases to AWS, resilient, self healing
- The sourcce db ermains available during the migraiton
- Supports homogenous and heterogeneous migratio n(i.e. Microsoft SQL Server -> Aurora or Oracele t Oracle)
- Continuous Data Replication using CDC
- You must create an EC2 instance to perform the replication tasks

### DMS Sources and Targets
Sources
- on prem dbs
- ec2 isntance dbs
- azure
- rds
- s3
- ocument db

Targets
- on prem and ec2 instance databases
- aamzon rds
- redshift, dynamodb, s3
- neptune
- KDS
- opensearch service
- documentDB
- redis & babelfish

TLDR:
`take an on-prem DB and migrate it to any DB AWS offers`

### AWS SChema Conversion Tool (SCT)
- convery DB Schema from one engine to another
- Example OLTP (SQL Server or Oracle) to MySQL, PostgreSQL, Aurora
- Example OLAP (Teradata or Oracle) to Amzon Redshift

If the engine is the same no need for SCT
`EXAM` even on prem PSQL to RDS PSQL? Still don't need SCT

### DMS Continuous Replication
- Install AWS SCT on a server on prem
- perform conversion -> Amazon RDS (MySQL DB target)
- Setup a DMS replication instance, full load, change data capture does the ACTUAL work/extract & put into RDS MySQL