# AWS Lambda File Systems Mounting
- Lambda function can access EFS file systems if they are running in a VPC
- Configure Lambda to mount FS file systems to local directory duing init
- must leverage EFS access points
- Limitation watch out for the EFS connection limits (one function = one connection) and connection burst limits

## Lambda Storage options
Ephemeral
- 10,240MB / 10 GB
- dynamic content
- file system
- incuded cost with lambda
- sharing/permissions function only
- fastest
- 1:1 per invocation

Lambda Layers
- up to 5 per function total 25MB
- persistent
- static content
- archive
- immutable
- included in lambda
- IAM based sharing/perms
- fastest
- shared across invoctions

S3
- elastic
- durable
- dynamic
- object
- atomic with versioning
- storage + requests + data transfer pricing
- IAM based
- fast
- shared across invoctions

EFS
- elsatic
- durable
- dynamic
- file system
- storage + data transfer + throughput pricing
- IAM + NFS permissions
- very fast
- shared across invoctions

