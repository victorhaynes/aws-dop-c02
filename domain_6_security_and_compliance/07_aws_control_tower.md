# AWS Control Tower
- easy way to setup and govern a secure and compliant multi account AWS env based on best practices

- benefits
    - automated the setup of your environment in a few clicks
    - automate ongoing policy mgmt using guardrails
    - detect policy violations and remediate them
    - monitor compliance through an interactive dashboard
- AWS control tower runs on top of AWS organizations
    - it automatically sets up AWS orgs to organize accounts and implement SCPs (Service Control Policies)

### AWS Control Tower Account Factory
- Automates account provisioning and deployments
- Enabels you to create pre-approved baseliens and configuration options for AWS accounts inyour org (VPC default cnoconfigfig, subnets, region)
- Uses AWS Service Catalog to provision new AWS accounts

## Control Tower - Detect and Remediate Policy Violations
Guardrails
- provides ongoing governance for your control tower environment (AWS accounts)
- preventive - using SCPs (disallow creation of access keys for the root user)
- detective - using AWS config (detect whether MFA for the root user is enabled
- ex. identify non-compliant resource (e.g., untagged resources)

## Guardrail Levels
Mandatory
- auto enabeld and enforced by AWS Control Tower
- example disallow public read access to the log archive account

Stronly Recommended
- based on AWS practices
- Example: enable encryptions for EBS volumes attached to EC2 instance

Elective
- commonly used by enterprises
- Example: disallow delete actions without MFA in S3 buckets

.

`revisit how I can enable tagging standards in my own project. this would be nice but can get costly`