# Exam Callouts

Short, topic-namespaced reminders extracted from the `EXAM` markers in the domain notes.

## Domain 1: SDLC Automation

- **CodeCommit cross-Region replication:** CodeCommit has no built-in cross-Region replication. Use an event-driven integration, such as EventBridge invoking a task or function that pushes to the other repository.
- **CodePipeline manual approval:** A manual approval action pauses the stage until approved, rejected, or timed out. It is commonly paired with SNS notifications.
- **AWS Amplify branches:** Amplify can create a separate deployment for each connected Git branch, such as `dev` and `prod`.
- **CodeBuild `buildspec.yml`:** `buildspec.yml` contains CodeBuild instructions and is conventionally stored at the source repository root.
- **CodePipeline cross-Region actions:** Each Region used by a pipeline action needs its own artifact store, and the pipeline service role needs access to every artifact bucket.
- **CodeDeploy ECS hooks:** ECS deployment lifecycle hooks use Lambda functions for validation; they do not run arbitrary EC2-style shell scripts.
- **CodeDeploy time synchronization:** `InvalidSignatureException` can result from incorrect instance time. Ensure the CodeDeploy host clock is synchronized.
- **CodeArtifact authorization:** CodeArtifact authorization is repository-scoped; a principal generally receives access to the repository rather than individual packages within it.

## Domain 2: Configuration Management and IaC

- **CloudFormation template structure:** `Resources` is the mandatory top-level CloudFormation section. Parameters, mappings, outputs, and metadata are optional.
- **CloudFormation parameters:** `AllowedValues` constrains valid input values; `NoEcho` masks parameter values in stack displays and logs, but is not a substitute for proper secret storage.
- **CloudFormation intrinsic functions:** Know `Ref`, `GetAtt`, `FindInMap`, `ImportValue`, `Base64`, and condition functions. `Fn::Base64` is commonly used with EC2 `UserData`.
- **CloudFormation creation rollback:** A failed stack creation rolls back and normally deletes created resources unless rollback behavior is changed.
- **CloudFormation update rollback:** A failed update normally rolls the stack back to the last known working state. A failed rollback may require `ContinueUpdateRollback` after fixing the underlying issue.
- **CloudFormation `DeletionPolicy`:** `Delete` removes a resource, `Retain` preserves it, and `Snapshot` creates a snapshot before deletion when supported. S3 buckets must be empty before deletion.
- **CloudFormation stack policies:** Stack policies protect resources during updates. Default behavior allows updates; explicit denies are used to protect resources such as production databases.
- **CloudFormation termination protection:** Termination protection prevents accidental stack deletion and is disabled by default.
- **CloudFormation wait conditions and signals:** Failed `cfn-init` or `cfn-signal`, missing helper scripts, bad network access, or rollback deletion can hide the useful EC2 logs. Disable rollback while troubleshooting.
- **CloudFormation dynamic references:** `ManageMasterUserPassword: true` can make CloudFormation create and manage an RDS or Aurora master password in Secrets Manager.
- **CloudFormation service roles:** A caller who supplies a CloudFormation service role generally needs `iam:PassRole` for that role.
- **CloudFormation custom resources:** Use a custom resource, commonly backed by Lambda, when CloudFormation needs custom CRUD logic such as emptying an S3 bucket before deletion.
- **CloudFormation drift:** Changes made through CloudFormation are not drift; drift is an out-of-band change relative to the declared stack configuration. StackSet-level and child-stack behavior must be considered separately.
- **CloudFormation troubleshooting:** CloudFormation cannot set properties that the underlying AWS service does not support, such as an EC2 private DNS name when no writable template property exists.
- **Service Catalog governance:** Service Catalog provides self-service products from administrator-approved templates, enforcing standardized configuration, tags, and governance.
- **Service Catalog launch constraints:** A launch constraint is an IAM role that Service Catalog assumes to launch or manage a product on behalf of a user.
- **Service Catalog stack-set constraints:** Stack-set constraints control which accounts, Regions, and permissions a product may use when deployed through CloudFormation StackSets.
- **Elastic Beanstalk deployment modes:** Rolling deployments reduce capacity during updates; rolling with additional batches preserves capacity but costs more; immutable and blue/green approaches provide stronger isolation.
- **Systems Manager Patch Manager:** Patch Manager can apply patches within a Maintenance Window, with scheduling, concurrency, and error-rate controls, and can feed compliance reporting.
- **SSM Default Host Management Configuration:** DHMC can configure EC2 instances as managed nodes without an instance profile, but instances still need IMDSv2 and a working SSM Agent.
- **SSM managed-instance requirements:** For normal SSM management, the agent must be installed and the node must have suitable IAM permissions, commonly `AmazonSSMManagedInstanceCore`, plus network access to SSM endpoints.
- **SSM Session Manager VPC endpoints:** Private Session Manager access requires the appropriate interface endpoints, typically `ssm`, `ssmmessages`, and `ec2messages` as applicable to the Region and agent behavior.

## Domain 3: Resilient Cloud Solutions

- **API Gateway endpoint types:** Edge-optimized endpoints use CloudFront for global clients, Regional endpoints serve a Region directly, and private endpoints are reachable through an interface VPC endpoint.
- **API Gateway monitoring:** `CacheHitCount` and `CacheMissCount` show whether API Gateway caching is serving requests from cache.
- **ECS launch type:** Fargate is often the simplest exam answer when the requirement is to run containers without managing EC2 capacity.
- **ECS capacity providers:** Capacity providers are for ECS capacity management, especially EC2 launch type, and are paired with an Auto Scaling group to provision capacity for tasks.
- **Lambda concurrency:** Lambda has an account concurrency quota, commonly 1,000 by default, and reserved concurrency can cap or reserve concurrency for a function.
- **Lambda aliases:** An alias can point to a published function version, but aliases cannot point to other aliases.
- **DynamoDB flexible schema:** Items in a DynamoDB table can have different attributes, allowing schema flexibility, but the access patterns and keys still need deliberate design.
- **DynamoDB on-demand capacity:** On-demand mode removes capacity planning and is useful for unpredictable or spiky workloads, but its per-request price is higher than well-utilized provisioned capacity.
- **DynamoDB Streams:** Streams retain ordered item-level changes for 24 hours and are commonly consumed by Lambda or the Kinesis adapter.
- **DynamoDB Global Tables:** Global Tables provide multi-Region active-active replication; DynamoDB Streams are a prerequisite for replication.
- **DynamoDB TTL:** TTL marks items for eventual deletion using an epoch timestamp. It is useful for sessions and expiring data, but deletion is not immediate.
- **ECR:** Amazon ECR is the managed registry for Docker/container images, including image tags, versioning, scanning, and lifecycle policies.
- **Kinesis Data Streams:** KDS is for real-time streaming ingestion such as clickstreams, IoT events, metrics, and logs.
- **Kinesis Data Firehose:** Firehose delivers and buffers streams in near real time to destinations such as S3, Redshift, and OpenSearch; it is a delivery service rather than a long-lived stream.
- **KDS versus Firehose:** KDS supports custom consumers and stream processing with retention; Firehose is managed delivery with buffering and transformation and does not require consumer management.
- **Managed Service for Apache Flink:** Flink reads from streaming sources such as Kinesis Data Streams. It does not use Firehose as its stream-processing source.
- **EKS portability:** Kubernetes is cloud agnostic, which makes EKS useful for migration and hybrid strategies, but AWS integrations are added through components such as CSI and CNI drivers.
- **EKS storage:** Persistent storage is commonly exposed through a Kubernetes `StorageClass` and a CSI-compliant driver.
- **EKS logging:** Use a log collector such as Fluent Bit or Fluentd to forward container logs to CloudWatch Logs; the CloudWatch Agent is primarily for metrics and host logs.
- **ElastiCache data structures:** Redis supports sets and sorted sets, making it suitable for use cases such as leaderboards.
- **RDS read replicas:** Read replicas scale reads and use asynchronous replication. They can be same-Region, cross-AZ, or cross-Region; they are not the same as Multi-AZ standby.
- **RDS read replicas and Multi-AZ:** A read replica can itself be configured for Multi-AZ for resilience, but Multi-AZ is for availability/failover rather than read scaling.
- **RDS Single-AZ to Multi-AZ:** Converting to Multi-AZ is designed as a managed operation with minimal or no application downtime, depending on the configuration and engine.
- **S3 replication:** Delete markers are not replicated by default in versioned replication; enable delete-marker replication when the requirement includes propagating deletes.
- **Route 53 CNAME records:** A CNAME cannot be created at the zone apex, such as `example.com`; use an alias record there. CNAMEs are appropriate for subdomains such as `www.example.com`.
- **AWS DMS and SCT:** If the source and target database engines are the same, DMS can generally migrate the data without Schema Conversion Tool. SCT is for heterogeneous engine conversion.
- **AWS Storage Gateway:** Storage Gateway is a hybrid storage bridge with File, Volume, and Tape Gateway modes, backed by AWS storage services such as S3, EBS, or Glacier.
- **Disaster recovery RPO:** RPO is the maximum tolerable data loss, usually determined by the interval between recoverable backups or replicas.
- **Disaster recovery RTO:** RTO is the maximum tolerable downtime before the workload must be restored.

## Domain 4: Monitoring and Logging

- **CloudWatch Logs aggregation:** CloudWatch Logs from multiple accounts and Regions can be centralized into a Kinesis stream for downstream processing.
- **CloudWatch alarms:** A standard alarm evaluates one metric; use a composite alarm to combine multiple alarms with `AND` or `OR` logic.
- **CloudWatch custom metrics:** CloudWatch accepts custom metric timestamps up to two weeks in the past and two hours in the future; incorrect instance time can misalign metrics.
- **CloudWatch log sources:** Know the distinction between application, system, VPC Flow, API Gateway, CloudTrail, Route 53, Lambda, ECS, and service-specific logs.
- **Athena:** Athena is serverless SQL for querying data in S3. Columnar formats such as Parquet or ORC reduce scanned data and query cost.

## Domain 5: Incident and Event Response

- **SNS redrive policy:** An SNS dead-letter queue is configured at the subscription level, not once at the topic level. Separate subscriptions can therefore have separate DLQs.
- **EventBridge input transformation:** EventBridge input transformers reshape a matched event before it is sent to the target; they do not require a separate Lambda function for simple field mapping.
- **AWS Distro for OpenTelemetry:** ADOT provides vendor-neutral telemetry collection and export for traces, metrics, and logs. Expect it as an integration/observability question rather than a deeply specialized service question.

## Domain 6: Security and Compliance

- **AWS Config:** Config evaluates and records compliance; it does not directly deny API actions. Use remediation, SCPs, IAM, or resource policies to prevent behavior.
- **AWS Config conformance packs:** A conformance pack is a YAML bundle of Config rules and optional remediation actions that can be deployed across accounts and Regions.
- **AWS Organizations account access:** Accounts created through Organizations receive `OrganizationAccountAccessRole`; invited existing accounts generally require that role to be created or configured manually.
- **Organizations discount sharing:** RI and Savings Plan sharing must be enabled for both the payer and participating accounts for sharing to apply.
- **SCP management account:** SCPs do not restrict the Organizations management account.
- **SCP explicit allows:** An account needs an applicable allow path through the root, OU, and account SCP hierarchy; SCPs define maximum permissions and do not grant IAM permissions.
- **Control Tower customizations:** CfCT and Account Factory for Terraform are exam-relevant customization mechanisms for deploying governed resources and account configurations.
- **AFT built-in options:** Account Factory for Terraform can optionally enable features such as CloudTrail data events, Enterprise Support, and deletion of the default VPC.
- **IAM Identity Center:** Identity Center provides one federated login and permission assignments across multiple AWS accounts.
- **IAM Identity Center SCIM:** SCIM automatically provisions and synchronizes users and groups from an external identity provider into IAM Identity Center.
- **AWS WAF:** WAF protects HTTP applications at Layer 7 and can attach to CloudFront, ALB, API Gateway, or AppSync. AWS Shield is the primary DDoS protection service.
- **AWS WAF managed rules:** Managed rule groups are reusable AWS- or Marketplace-maintained protections for common threats, SQL injection, IP reputation, and bots.
- **AWS WAF IP reputation:** `AWSManagedRulesAmazonIpReputationList` blocks requests associated with known malicious IP reputation data.
- **GuardDuty cryptocurrency findings:** GuardDuty has findings for cryptocurrency mining activity, making it a common detection example.
- **GuardDuty CloudFormation integration:** GuardDuty enablement is not safely assumed to be idempotent in every deployment pattern; a custom resource can check current state before enabling it.
- **Amazon Inspector:** Think compute vulnerability assessment: EC2 instances, container images, and Lambda packages rather than general threat detection.
- **Amazon Secrets Manager:** Secrets involving RDS or Aurora credentials, rotation, and database integration point toward Secrets Manager rather than ordinary configuration storage.
- **AMI sharing:** AMIs can be shared when backed by unencrypted volumes or volumes encrypted with a customer-managed KMS key. Encrypted AMI sharing also requires sharing the relevant KMS key permissions.
- **Tag Editor:** Tag Editor can create, update, delete, and find tags across supported resources and Regions; it is useful for discovering untagged resources.
- **QuickSight:** QuickSight is managed BI and visualization with integrations to services such as S3, Athena, Redshift, RDS, and Aurora.
- **AWS Glue and Parquet:** Glue can transform data into Parquet, a columnar format that lets Athena scan less data and reduce query cost.
- **Glue job bookmarks:** Job bookmarks track processed data so recurring Glue jobs avoid reprocessing previously handled records.

