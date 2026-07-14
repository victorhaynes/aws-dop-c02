# Disaster Recovery in AWS
Expect some questions on the `EXAM`
- Any event that has a negative impact on a company's business continuity or finances is a disaster
- DR is about preparing for and recovering from a disaster
- What kinds of DR? onprem->onprem is legacy/expensive
- onprem->cloud hybrid
- or cloud fully

`RPO`: recovery point objective
`RTO`: recovery time objective

RPO `EXAM`: how often you run backups time between RPO and disaster == data loss (i.e. hourly backup can mean 1 hour of data loss)

RTO `EXAM`: how much downtime after the disaster

### DR Strats
- `Backup and restore`: no live standby infra, stand up when needed. High RPO high RTO
- `Pilot Light`: critical core running only
- `Warm standby`: full system running minimal scale
- `Hot sight`: system running full scale, just shift traffic

Slower RTO
->
Faster RTO

Basically different levels of redundancy/readiness/over allocation

Lowest RPO/RTO is best i.e. 1 second RTO and 1 second RPO is the best

## DR Tips
Backup
- EBS snapshots, RDS autoamted backups, snapshots etc
- regular pushes to s3 / s3 ia /glaicer/ lifecycle policies, CRR
- from on prem snowball or storage gateway

High Availability
- use route53 to migrate DNS over from region to region
- RDS multi-AZ elasticache, multi-az, EFS, s3
- siet to site VPN as a recovery from direct connect

Replication
- RDS replication (CR),AWS aurora + global databases
- database replication from on-prem to RDS
- storage gateway


Automation
- CF/ Elsatic Beanstalk
- cloudwatch alarms
- lambda function

Chao
- Netflix "simian-army" example randomly destroying prod resources IRL