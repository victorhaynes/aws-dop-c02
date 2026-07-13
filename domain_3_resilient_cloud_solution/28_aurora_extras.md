# Aurora Extras

## Aurora Replicas - Auto Scaling
Writer instance always reachable by writer endpoint
- if a write isntance goes down another aurora instance may be promoted as the writer

Reader Endpoint
- updated based on how many read instances you have 
- reader endpoints automatically extended

## Global Aurora
- Cross Region Read Replicas
    - Useful for DR
    Simple to put in place
- Aurora Globla Databse (recommended)
    - 1 Primary region read/write
    - up to 10 read only regions, replicastion elss than 1  sec
    - up to 16 read replicas per secondary region
    - promoting another region for DR hasa RTO of <1 min
    - Typical cross-region replication takes less than 1 second  

## Amazon Aurora Unplanned Failover
- Can make a almbda function perform health checks on your main Global Aurora
- perform API calls and SSM params/secrets updates etc

## Amazon Aurora - Global Application
- Application accesses local (regional) data
- also accesses replicated global Aurora db data
