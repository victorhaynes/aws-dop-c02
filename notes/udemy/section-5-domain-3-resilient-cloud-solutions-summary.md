# Section 5: Domain 3 - Resilient Cloud Solutions

## What this section covers

This section is about designing resilient, scalable, and recoverable cloud systems. It mixes service-level resiliency features with deployment patterns and data replication patterns.

## 1. Lambda resiliency and deployment controls

- Lambda `versions` are immutable snapshots.
- Lambda `aliases` are mutable pointers to versions.
- Aliases support weighted routing, which enables canary-style rollout.
- Key exam point:
  - aliases point to versions, not to other aliases
- `Environment variables` allow config changes without code changes.
- `Reserved concurrency` limits a function and protects account-level concurrency from one noisy function.
- `Provisioned concurrency` reduces cold starts by keeping initialized execution environments ready.
- Asynchronous throttled events are retried automatically, then can end up in failure handling paths such as DLQ/destination patterns.
- Lambda can mount `EFS`, including cross-account patterns when configured correctly.

## 2. API Gateway

- API Gateway can front:
  - Lambda
  - HTTP endpoints
  - AWS service integrations
- Stages are deployment environments like `dev`, `test`, and `prod`.
- Changes do not go live until you deploy the API.
- `Stage variables` let you vary configuration by stage, often to point stages at different Lambda aliases.
- API definitions can be imported/exported with `OpenAPI`.
- Built-in resilience/performance controls:
  - caching
  - canary deployments
  - monitoring, logging, tracing
- Security/auth patterns mentioned in API Gateway matter for exam framing even when the lecture is not security-focused.

## 3. ECS, ECR, and EKS

- `ECS` is a container orchestration service.
- Resiliency themes:
  - service scaling
  - Auto Scaling integration
  - load balancer-backed service architecture
  - centralized logging
- `ECR` is the image registry that supports container deployment workflows.
- `EKS` is managed Kubernetes, and logging/observability integration matters operationally.

## 4. Streaming and near-real-time architectures

- `Kinesis Data Streams` is for ingesting ordered streaming data.
- `Kinesis Data Firehose` is for delivering streaming data to destinations such as S3 and analytics stores.
- `Managed Service for Apache Flink` handles stream processing.
- Resilience angle:
  - decouple producers and consumers
  - buffer spikes
  - support replay/processing downstream

## 5. Route 53 routing strategies

- Weighted routing is useful for traffic splitting and controlled rollout.
- Latency routing sends users to the region with lowest latency.
- Failover routing supports active/passive recovery patterns.
- Route 53 is central to multi-region availability and recovery strategy questions.

## 6. Database and cache resiliency

### RDS / Aurora

- Know the difference between:
  - `Read Replicas` for scaling reads
  - `Multi-AZ` for availability/failover
- Aurora extras usually reinforce HA and managed failover behavior.

### ElastiCache

- Used to reduce database load and improve latency.
- Redis cluster mode distinctions matter:
  - cluster mode disabled vs enabled
  - how scaling and sharding behavior changes

### DynamoDB

- Core resilient NoSQL option with managed scale.
- Advanced features are usually about durability, scaling behavior, and access patterns.

## 7. Migration and replication

- `AWS DMS` supports migration and replication workflows.
- Monitoring DMS matters operationally for long-running replication tasks.
- `S3 Replication` is an explicit resiliency tool:
  - cross-region replication
  - same-region replication
- `Storage Gateway` connects hybrid storage patterns to AWS and includes operational behaviors like cache refresh.

## 8. Auto Scaling and load balancing

- Auto Scaling policy types are central:
  - target tracking
  - step scaling
  - simple scaling
- `Lifecycle hooks` let you pause instance launch/termination to run custom actions.
- `Event notifications` surface scaling events.
- `Termination policies` control which instances go away first.
- `Warm pools` reduce launch latency by keeping pre-initialized instances available.
- `Application Auto Scaling` extends scaling concepts beyond EC2 ASGs.
- `ALB rules` and load-balancer extras matter for resilient traffic steering.
- `NAT Gateway` is a managed outbound access path that removes single-instance NAT patterns.

## 9. Architecture patterns

- `Multi-AZ` means surviving an Availability Zone failure.
- `Blue/Green` means parallel environments and controlled cutover.
- `Multi-Region` means surviving broader regional failure and improving geographic availability.
- `Disaster Recovery` is the umbrella topic tying these together.

## What to memorize for DOP-C02

- Lambda versions are immutable.
- Lambda aliases are mutable and support weighted traffic shifting.
- Reserved concurrency protects both the function and the rest of the account.
- Provisioned concurrency is the cold-start mitigation feature.
- API Gateway stage changes require deployment.
- Stage variables commonly map stages to Lambda aliases.
- Weighted/latency/failover Route 53 routing patterns are common exam traps.
- `Read Replica` is not the same as `Multi-AZ`.
- Lifecycle hooks pause ASG transitions for custom processing.
- Warm pools reduce scale-out latency.

## Lecture map

- Lectures 106-113: Lambda advanced deployment/runtime topics
- Lectures 114-123: API Gateway
- Lectures 124-131: ECS, ECR, EKS
- Lectures 132-137: Kinesis and Flink
- Lectures 138-141: Route 53 routing
- Lectures 142-149: RDS, Aurora, ElastiCache, DynamoDB
- Lectures 150-156: DMS, S3 replication, Storage Gateway
- Lectures 157-165: Auto Scaling and load balancing
- Lectures 166-170: NAT, Multi-AZ, blue/green, multi-region, DR
