# RDS Read Replicas vs Multi-AZ
`EXAM`
RDS Read replicas vs Multi AZ

## RDS Read Replicas
- helps you scale reads
- Up to 15 read replicas, within AZ, cross AZ, or cross region `EXAM` all important
- ASYNC replication between the main RDS DB instance and the main one
    - ASYNC meaning they will EVENTUALLY be consistent
    - read replica can be promoted to its own DB (take it out of the replication )

- Application must update the connection string to leverage read replicas

## RDS Read Replicas Use Cases
- Prod DB taking on a nomral load
- you want to run a reporting application for analytics on your prod DB
- syou can create a read replicas and run analytics on the read replica--leaving PROD uneffected
- only for `SELECT` types of statements no `INSERT, UPDATE, DELETE`

## RDS Read Replicas - Network Cost
- In AWS there's a network cost when data goes from one AZ to another
- For RDS read replicas within the same region you don't pay that fee
i.e. in us-east-1
- RDS DB in us-east-1a
- RDS DB replica in us-east-1b
- thenthe data transfer cross AZ will be free--even though younormally pay

But for cross-region there is a cost

## RDS Multi AZ (Disaster Recovery)
- SYNC replication to a standby instance in nother DB
- One DNS name - automatic app failvoer to standby (application uses one connection string/domain name)
- increase availability
- failover
- no manual intervention in apps as long as the app already re-tries on DB failure
- NOT USED FOR SCALING
- `EXAM`: Note the read replicas can be setup as Multi AZ for DR
    - TLDR: you can setup your read replicas as multi AZ for DR if you want to. but they are not the same thing


## `EXAM` RDS - From Single-AZ to Multi AZ
- Zero downtime operation
- Just click on modify for the database

Internal steps:
1. snapshot taken
2. snapshot restored into a new DB in a new AZ
3. synchornization is established
4. done, multi AZ is now up