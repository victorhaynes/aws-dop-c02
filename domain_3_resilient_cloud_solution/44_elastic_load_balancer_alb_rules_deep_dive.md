# Elastic Load Balancer ALB Rules Deep Dive
- Processed in order (with Default Rule)
- SupportedACtions (forward, redirect, fixed-response)
- Rule Conditions:
    - host-header
    - http-request-method
    - path-pattern
    - source-ip
    - http-header
    - query-string

## Target Group Weighting
- Specify weight for each Target Group on a single Rule
- Example: multiple versions of your app, blue/green deploymen
- Allows you to control the distr of the traffic to your application 