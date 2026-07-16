# AWS Firewall Manager Policies
- Policy Type: AWS WAF
    - Enforce applying WebACLs to l ALBs in all accounts in the AWS org
    - identity resources that don't reply but don't auto remediate
    - auto remediate
- Policy Type: Shield Advanced
    - Enforce Shield ADvanced protections in all accoutns in an ORg
    - identify only / or auto remediation
- Security Group Policy Type: Common SGs
    - Enforce applying SGs to all EC2 instances in all accoutns in AWS Org
- Security Group Policy Type: Auditing of Security Group Policy
    - Check and managed SG Rules in al laccoutns in AWS Org
- Security Group Policy Type: Usage Audit Security SG Policy
    - find redundant or unused, optional clean up
- Policy Type: Network Firewall
    - Centrally maanged Network Firewall firewalls in all accounts in AWS Org
    - Distributed - maintains firewall endpoint in each VPC
    - Centralized - maintains firewall endpoint in a centralized VPC
    - Import Existing Firewalls - import existing firewalls using REsoruce Sets
- Policy Type: Route53 REsolver DNS Firewall
    - Maange associations between Resolver DNS Firewall Rule Groups and VPCs in all accounts in AWS Organization

`revisit WAF`