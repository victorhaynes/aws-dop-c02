# Amazon ElastiCache
- Maanged Redis or Memcached (the same way RDS is for smoething like manged PSQL)
- In memory high performnce database
- Helps reduce load off of databses for read intensive workloads
- Helps make your aplication stateless
- AWS takes care of OS maintenance, patching, optimization, config, monitoring, failure recovery and backups

Obviously, your app should work with a cache hit/miss pattern. This is not drop in front of an existing app/api/client

### Redis vs Memcached
Note there is also `Valkey` which works jsut like Redis

Redis
- Multi AZ with auto failover
- read replicas to scale and have high availability
- data durability using AOF persistence
- back up and restore features
- supports sets and sorted sets (good for leaderboards) `EXAM`
Memcached
- multi-node for paritioning of data 
- no high availability
- non-persistent
- back up and restore (Sererless)
- multi-treaded architecture