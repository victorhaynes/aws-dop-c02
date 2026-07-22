# AWS Firewall Manager
- Manage rules in all accoutns of an AWS org
- across many accounts at the same time
- Security policy: common set of security rules
    - WAF rules (ALB, API Gateway, CF)
    - Shield Advanced rules (ALB, CLB, NLB, EIP, CF)
    - SGs for EC2
    - AWS Network Firewall (VPC level)
    - Amazon Route 53 Resolver DNS firewall

- Rules are applied to new resoruces as they are created (good for compliance) across all and future accounts in your Org


## WAF vs Firewall Maanger vs Shield
- used together for comprehesve protection
- define your Web ACL rules in WAF
- for granular protection of your resources, WAF alone is the correct choice
- If you want to use AWS WAF across accounts, accelerate WAF configuration, autoamte the protection of new resources, use Firewall Manager with AWS WAF
- Shield Advanced additional featurews on top of AWS WAF, such as dedicated support from the Shield Response Team (SRT) and advanced reporting
- If you're prone to frequent DDoS attacks, consider purcasing Shield Advanced