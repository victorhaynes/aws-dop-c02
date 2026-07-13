# AWS DMS Monitoring
Can monitor the replication tasks itself
- Task Status
- Task Status Bar
- Table State

### CloudWatch Metrics
- Replication task metrics
    - statistics for replication task incldued incoming and committed changes, latency between the replication host and both source and target databases
- Host metrics
    - for the replication host, cpu, ram, storage, iops etc
- Table metrics
    - Statistics for tables that re in the process of being migrated including inserts/ crud etc