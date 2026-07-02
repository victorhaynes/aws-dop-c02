# CodeDeploy - Redeploy & Rollbacks
- `Rollback` redeploy a previously deployed revision of your application
- Deployments can be rolled back
- automatically or manually OR can be disabled all together
- If a rollback happens the last known good version will be selected

## CodeDeploy Troubleshooting
- `EXAM`
```sh
Deployment Error: "Invalid SignatureException
```
- For CodeDeploy to perform its ops, it requries accurate time references
- If the date and time on your EC2 instance are not set correctly, they might not match the signatur date of your deployment request, which CodeDeploy rejects
.

- When the Deployment or all  Lifecycle Events are skipped (EC2/on-prem)
```sh
"The overall deployment failed becasue too many individual instances failed deployment"

"Too few healthy instances are vailable for deployment"

"Some instances in your deployment group are experiencing problems (Error code: HEALTH_CONSTRAINTS)"
```

Reasons
- CodeDeploy Agent might not be installed, running, or reachable
- CodeDeploy Service Role or IAM instance profile might not have requried perms
- You are using an HTTP Proxy, configure CodeDeploy Agent with `:proxy_uri`: param

Failures can be interecept in EventBridger

# Troubleshooting ASGs
- if ASG scales-out during a deployment you can get a mixed v1 and v2 state, but CodeDeploy will move all to green/v2 automatically

# CodeDeploy - Troubleshooting
Blue Green AllowTraffic
- Issue: failed allow traffic lifecycle event in b/g
- reason health checks may be incorrectly configured for your ELB