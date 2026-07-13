# Route 53 Routing Policy Latency
- Redirect to the resource that has the least latency close to us
- Super helpful whenlatency for users is a priority
- Latency is based on traffic between users and AWS Regions
- I.e. German users get routed to us-east-1 ALB instead of the ap-southeast-1 ALB

