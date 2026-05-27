# Section 8: Domain 6 - Security and Compliance

## What this section covers

This section is the governance and detective-security layer: configuration compliance, multi-account governance, centralized access, network/app protection, threat detection, vulnerability scanning, advisory services, and secret management.

## 1. AWS Config

- AWS Config records resource configuration history and evaluates resources against rules.
- It answers questions like:
  - is SSH too open?
  - did this resource configuration change?
  - is this resource compliant with policy?
- Important points:
  - Config is regional
  - rules can be AWS-managed or custom
  - rules can trigger on configuration change or on a periodic schedule
- Config rules do not block actions.
- They detect and report compliance state.

## 2. Config recorders, aggregators, and remediation

- `Configuration Recorder` is required to collect configuration items.
- `Aggregator` centralizes Config data from multiple accounts/regions.
- A common org-wide pattern:
  - deploy recorders with `StackSets`
  - protect them with `SCPs`
  - aggregate results centrally
- `SSM Automation` documents can remediate non-compliant resources.
- Automatic remediation can retry.

## 3. Conformance Packs and Organizational Rules

- `Conformance Packs` are YAML bundles of config rules and remediation actions.
- Good mental model:
  - CloudFormation-like packaging for Config governance
- `Organizational Rules` push Config rules across an organization from the management or delegated admin account.
- Difference in spirit:
  - Organizational Rules are one-rule-at-a-time org-level deployment
  - Conformance Packs are multi-rule packaged deployment with wider flexibility

## 4. AWS Organizations

- Organizations provides centralized multi-account management.
- Key structures:
  - `management account`
  - `member accounts`
  - `organizational units (OUs)`
- Important role:
  - `OrganizationAccountAccessRole`
- Feature modes:
  - consolidated billing
  - all features
- `All features` is what enables things like `SCPs`.
- Consolidated billing lets usage discounts apply across accounts.

## 5. Service Control Policies (SCPs)

- SCPs set the maximum available permissions for member accounts.
- They do not grant permissions by themselves.
- They are preventive controls at the organization/OU/account level.
- Common use:
  - deny risky services or regions
  - prevent disabling security tooling
  - block root-account actions

## 6. AWS Control Tower

- Control Tower is the managed multi-account governance framework built on Organizations.
- It sets up a `landing zone`.
- A landing zone usually includes:
  - organization structure
  - guardrails
  - IAM Identity Center integration
  - shared accounts like log archive and audit
  - account provisioning workflows
- `Account Factory` standardizes new account creation.
- `CfCT` extends Control Tower with GitOps-style customization pipelines.
- `Account Factory for Terraform` exists when Terraform-based account provisioning is desired.
- Config integrates with Control Tower for detective guardrails and centralized compliance views.

## 7. IAM Identity Center

- Centralized workforce access service for AWS accounts and apps.
- Good mental model:
  - modern SSO/control-plane access layer for multiple accounts
- Often paired with Organizations and Control Tower.

## 8. WAF and Firewall Manager

### AWS WAF

- Protects web applications against web-layer attacks.
- Typical controls:
  - IP filtering
  - rate limiting
  - managed rules
  - request inspection

### AWS Firewall Manager

- Central policy management for WAF, Shield Advanced, security groups, and related controls across accounts.
- Especially useful in organization-scale environments.

## 9. GuardDuty and Detective

### GuardDuty

- Threat detection service using sources such as:
  - VPC Flow Logs
  - CloudTrail
  - DNS logs
  - Kubernetes audit logs and runtime-related sources in advanced setups
- Generates findings for suspicious activity.
- EventBridge integration enables automated response.
- Trusted IP lists and threat IP lists are exam-relevant details.
- Good exam trap:
  - enabling GuardDuty through CloudFormation can fail if it is already enabled
  - the course calls out using a custom resource/Lambda pattern to make enablement idempotent

### Detective

- Investigation/root-cause service that correlates GuardDuty, CloudTrail, VPC Flow Logs, and other security data into a graph-style analysis view.

## 10. Inspector

- Automated vulnerability assessment for:
  - EC2
  - ECR container images
  - Lambda functions
- Uses SSM-managed-instance visibility for EC2 findings.
- Continuously evaluates CVEs and network exposure where applicable.
- Findings can flow to Security Hub and EventBridge.

## 11. Migration, advisory, and secret storage

### EC2 migration using AMIs

- AMI-based migration is a practical lift-and-shift style building block for instance movement or duplication.

### Trusted Advisor

- Advisory service across categories like:
  - cost
  - performance
  - security
  - fault tolerance
  - service limits
  - operational excellence
- Full feature set depends on support plan tier.
- EventBridge can react to some Trusted Advisor events.

### Secrets Manager

- Secret storage service with:
  - managed rotation workflows
  - strong integration with RDS/Aurora and other services
  - KMS encryption
  - multi-region secret replication
- Important distinction from Parameter Store:
  - Secrets Manager is the stronger fit when automated rotation is a core requirement

## What to memorize for DOP-C02

- Config detects compliance; it does not enforce access like IAM or SCPs.
- Conformance Packs are packaged sets of Config rules/remediations.
- `SCPs` restrict maximum permissions and do not grant permissions.
- `OrganizationAccountAccessRole` is the cross-account admin role pattern in Organizations.
- Control Tower landing zones combine Organizations, guardrails, Identity Center, and shared accounts.
- GuardDuty is detection; Detective is investigation.
- Inspector covers EC2, ECR, and Lambda.
- Secrets Manager is the rotation-first managed secret store.

## Lecture map

- Lectures 207-211: AWS Config
- Lectures 212-213: AWS Organizations and SCPs
- Lectures 214-220: Control Tower
- Lectures 221-222: IAM Identity Center
- Lectures 223-225: WAF and Firewall Manager
- Lectures 226-229: GuardDuty and Detective
- Lectures 230-231: Inspector
- Lecture 232: EC2 migration using AMIs
- Lectures 233-234: Trusted Advisor
- Lectures 235-236: Secrets Manager
