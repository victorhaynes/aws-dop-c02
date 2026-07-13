# Route 53 Routing Policy Failover
Active-Passive

Route53 -> `mandatory` health check -> EC2 primary instance

Clint automatically gets the healthy instance, if the health check fails then the secondary instance will serve