# AWS WAF
- Protects your web applications from common web exploits   (layer 7 / HTTP `EXAM`)
- Deploy on ALB
- Deploy on API Gateway
- Deploy on CloudFront
    - used to front other solutions: CLB, EC2 isntance, custom origins, S3 websites
- Deploy on AppSync (protect GraphQL APIs)

WAF is not for DDos Protection - Shield is `EXAM`

- Define Web ACL (Access Control List)
    - Rules can include IP addresses, HTTP headers, HTTP body, or URI strings
    - Protects from common attack - SQL injection and Cross-Site Scripting (XSS)
    - Size constraints, Geo match
    - Rate-based rules (to count ocurences of events)
- Rule Actions: Count/Allow/Block/CAPTCHA/Challenge

(Count is count the occurences but allow the traffic)


# AWS WAF - Managed Rules
`EXAM`
- 190+
- Ready to use from AWS and AWS Marketplace Sellers
1. `Baseline Rule Groups`: general protecton from common threats
    - AWSManagedRulesCommonRuleSet, AWSManagedRulesAdminPRotectionRuleSet,..
2. `Use-case Specific rule Groups`: protection for many AWS WAF use cases
    - AWSManagedRulesSQLiRuleSet, AWSManagedRulesWindowsRuleSet, AWSManagedrulesPHPRuleSet, AWSManagedRuleWorldPressRuleSet, ...
3. `IP Reputation Rule Groups`: block requsts based on source (e.g., malicious IPs)
    - `AWSManagedRulesAmazonIpReputationList` - `EXAM`, AWSManagedRulesanonymousIpList
    - list of trusted and untrusted ips according to AWS
4. `Bot Control Managed Rule Groups` - block adn mange requests from bots
    - AWSManagedRulesBotControlRuleSet

# WAF Web ACL - Logging
- You can send your logs to a
    - Amazon CW log group - 5 MB per second
    - Amazon Simple Storage Service (aamzon S3) bucket - 5 minute interval
    - Amazon Data Fierhose - limited by Firehose quotas

    from firehose can send to S3, redshift, opensearch etc

## Solution ARchitecture - Enhance CF Origin Security with AWS WAF & AWS Secrets Maanger

[User] -> [AWS WAF in front of CF] -> [CF] -> [WAF in front of ALB] -> [ALB] ->>> ASG[EC2 instances]

The idea is that you put WAF infront of CF for some client protections, CF adds a custom header with a secret value, then the 2nd WAF instance filters traffic to reject everyhing except traffic with that header & secret...so only traffic that went through CF can hit your ALB

Can also setup auto rotation using AWS secrets manager/labda to setup the custom header value