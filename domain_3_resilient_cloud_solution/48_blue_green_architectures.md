# Blue-Green Architectures
ALB example listens on blue target group

Can add a green target group on the same listener

Can switch the traffic at once, or use weights
.

.

.

Can do the same at the Route53 level but clients cahe the DNS record so it is not as instant

### API Gateway
- Prod stage connected to v1 application
- Prod Stage (canary) connected to v2 application
- then we can promote canary to full when desired

or we can use a Lambda Alias, same stage but change the underlying target of the lambda alias