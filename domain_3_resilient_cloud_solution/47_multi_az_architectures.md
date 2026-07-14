# Multi-AZ Architectures
- Services where Multi-AZ must be enabled manually
    - EFS, ELB, ASG, Beanstalk: assign AZ
    - RDS, elasticcache: multi-az (synchronous standby DB for failovers)
    - Aurora
        - data is storred autoamtically across multi AZ
        - can have multi-AZ for the DB itself (same as RDS)
    - OpenSearch (managed) multi master
    - Jenkins (self deployed): multi master

- Services where Multi-AZ is implicity there
    - S3 (except for OneZone-Infrequent Access)
    - DynamoDB
    - All of AWS' proprietary, mnaged services

### Multi-AZ Architectures
just a photo