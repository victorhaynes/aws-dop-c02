# ElastiCache Redis Cluster Modes
2 modes

### Default `ElastiCache Replication: Cluster Mode Disabled`
- One primary node, upto 5 replicas
- One Shard, One Cache Primary Node, 0-5 Cache Replica Nodes
- ASYNC replication
- primary read/write
- others are read-only
- One shard, all nodes have all the data
- Guard against data loss if node failure
- Multi-AZ enabled by default for failover
- helpful to scale read performance

2 types of scaling
- Horizontal - adding or removing read replicas
- Vertical - larger/smaller node types

### `ElastiCache Replication: Cluster Mode Enabled`
- Data is partitioned across shards (helpful to scale writes)
- Each shard has a primary and up to 5 replicas nodes (same concept as before)
- Multi-AZ capability
- Up to 500 nodes per cluster
    - 500 shards single master
    - 250 shards iwth 1 master and 1 replicas
    - 83 sahrds with one master and 5 replicas etc

TLDR: interested in sharding your data, i.e. scale your writes with data partitioned across many shards

In this mode you can enable Auto Scaling
- Target Tracking and Scheduled Scaling Policies
- Only for `Cluster Mode Enabled`
- Application should use a `cluster configuratio endpoint` since the shards are chaning/scaling behidn the scenes. Like a single entrypoint

### Redis Connection Endpoints
- Standalone Node
    - one endpoint for read and write operations
- Cluster Mode Disabled Cluster
    - Primary Endpoint - write ops
    - Reader Endpoint - read ops split across all replicas
    - Node Endpoint - for read ops
- Cluster Mode Enabled Cluster
    - Configuration Endpoint - or all read/write operations that support Cluster Mode Enabled commands
    - Node Endpoint - for read ops