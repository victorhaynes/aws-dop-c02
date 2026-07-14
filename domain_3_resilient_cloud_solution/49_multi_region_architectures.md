# Multi-Region Architectures
- Health Check - autoamted DNS failovers
1. health checks (helpful to creaet a http /health route/endpoint on your target)
2. health checks that monitor other health checks
3. health checks that monitor cloduwatch alarms

## Route53 Multi Region ARchitectuers
- can do latency based routing for downstream regions
- and then use a global DynbamoDB table at the data layer for low latency constent data access

## Multi Region Architectures - Complex Routing
- can mix latency with failover routing