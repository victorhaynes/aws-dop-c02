# Section 4: Domain 2 - Configuration Management and IaC

## What this section covers

This section is the infrastructure-as-code and configuration-management block of the course. The center of gravity is `CloudFormation`, then the higher-level deployment/configuration tools built around it: `Elastic Beanstalk`, `SAM`, `CDK`, `Step Functions`, `AppConfig`, and `Systems Manager`.

## 1. CloudFormation fundamentals

- CloudFormation is AWS infrastructure as code using declarative templates.
- A `stack` is the deployed unit.
- `Resources` is the only mandatory template section.
- Core template sections to remember:
  - `Parameters`
  - `Mappings`
  - `Outputs`
  - `Conditions`
  - intrinsic functions like `Ref`, `GetAtt`, `Sub`, `Join`, `FindInMap`, `ImportValue`, `Base64`
- Typical workflow:
  - upload template
  - create stack
  - update by supplying a new template
  - delete stack to remove managed resources

## 2. CloudFormation stack lifecycle and safety features

- Stack updates can:
  - modify resources in place
  - replace resources entirely
- `Change Sets` are the safe preview mechanism before execution.
- Rollback behavior matters:
  - create failure normally rolls back and deletes created resources
  - update failure normally rolls back to the last known good stack state
  - if rollback itself fails, use `continue-update-rollback`
- `Termination Protection` prevents accidental stack deletion.
- `Stack Policy` protects critical resources from update actions.

## 3. CloudFormation template behavior worth memorizing

- `Parameters` are runtime inputs.
- `Mappings` are static lookup tables.
- `Outputs` can export values for other stacks.
- `Conditions` let you create resources only when criteria are true.
- `ImportValue` is how one stack consumes another stack's exported outputs.
- `Base64` is commonly used for `EC2 UserData`.
- `DependsOn` forces creation ordering when implicit dependency detection is not enough.

## 4. CloudFormation security and operational controls

- `Service Roles` let CloudFormation create resources on behalf of users with least privilege.
- Users passing a service role need `iam:PassRole`.
- `Capabilities` acknowledge sensitive template behavior:
  - `CAPABILITY_IAM`
  - `CAPABILITY_NAMED_IAM`
  - `CAPABILITY_AUTO_EXPAND`
- If a template creates IAM resources and you do not acknowledge capabilities, stack creation fails with an insufficient capabilities error.

## 5. Retention, deletion, and drift

- `DeletionPolicy` controls what happens when the stack is deleted or the resource is removed from the template.
- Important values:
  - `Delete`
  - `Retain`
  - `Snapshot`
- Good exam note:
  - S3 bucket deletion fails if the bucket is not empty, even if the deletion policy is `Delete`.
- `Drift Detection` checks whether real resources have diverged from the template definition.
- `cfn-hup` helps react to metadata changes on EC2 instances after stack updates.

## 6. EC2 bootstrapping with CloudFormation

- `UserData` initializes instances at launch.
- `cfn-init` configures packages, files, commands, and services from template metadata.
- `cfn-signal` reports success/failure back to CloudFormation.
- `WaitCondition` and `WaitConditionHandle` can pause stack progress until a signal is received.
- These pieces are important when stack creation depends on instance-side initialization completing correctly.

## 7. Stack composition and multi-account rollout

- `Nested Stacks` let you split large templates into smaller reusable pieces.
- `StackSets` are for deploying stacks across:
  - multiple accounts
  - multiple regions
- StackSets are a major exam concept for centralized org-wide rollout.

## 8. Service Catalog

- Service Catalog is the controlled self-service layer for approved infrastructure products.
- Use it when you want teams to deploy vetted templates without giving them unrestricted infrastructure freedom.

## 9. Elastic Beanstalk

- Elastic Beanstalk is a managed application deployment platform.
- It provisions and manages infrastructure like:
  - EC2
  - Auto Scaling
  - load balancers
  - deployment workflows
- Deployment models are important:
  - all at once
  - rolling
  - rolling with additional batch
  - immutable
  - blue/green
- High-availability environments usually rely on load balancing plus multiple instances.

## 10. SAM and CDK

### SAM

- `SAM` is the serverless abstraction layer over CloudFormation.
- It simplifies Lambda, API Gateway, and related serverless resources.
- It integrates with `CodeDeploy` for safe Lambda traffic shifting.

### CDK

- `CDK` defines infrastructure in familiar programming languages and synthesizes to CloudFormation.
- Good mental model:
  - CDK is higher level than raw CloudFormation
  - CloudFormation is still the deployed backend mechanism

## 11. Step Functions and AppConfig

### Step Functions

- State-machine orchestration service for workflows.
- Useful for sequencing Lambdas and service integrations with retries, branching, and visible execution flow.

### AppConfig

- Configuration deployment service.
- Designed for safe runtime config rollout, validation, and rollback of application configuration.

## 12. Systems Manager

- Systems Manager is the operational control plane for managed instances and hybrid nodes.
- High-value capabilities:
  - `SSM Agent`
  - Resource Groups and tagging
  - `Run Command`
  - `Automation`
  - `Parameter Store`
  - `Patch Manager`
  - `Maintenance Windows`
  - `Session Manager`
  - Hybrid activations / hybrid environments
  - Compliance
  - `OpsCenter`
- Good exam notes:
  - `Parameter Store` is central for configuration and secret-like parameter retrieval.
  - `Session Manager` allows shell access without opening inbound SSH.
  - `Patch Manager` and `Maintenance Windows` are core patching controls.
  - `DHMC` is about default host management for managed instances.
  - SSM works beyond EC2, including hybrid/on-prem and some edge scenarios.

## What to memorize for DOP-C02

- `Resources` is the only required CloudFormation section.
- `Change Sets` preview updates before execution.
- `DeletionPolicy` values: `Delete`, `Retain`, `Snapshot`.
- `CAPABILITY_NAMED_IAM` is required for named IAM resources.
- `cfn-init`, `cfn-signal`, `WaitCondition`, and `cfn-hup` are distinct and exam-relevant.
- `StackSets` are for multi-account and multi-region deployment.
- `SAM` is CloudFormation-focused serverless IaC.
- `CDK` synthesizes to CloudFormation.
- `Session Manager` avoids direct SSH exposure.

## Lecture map

- Lectures 35-68: CloudFormation
- Lectures 69-70: Service Catalog
- Lectures 71-76: Elastic Beanstalk
- Lectures 77-78: SAM
- Lectures 79-80: CDK
- Lectures 81-83: Step Functions
- Lecture 84: AppConfig
- Lectures 85-105: Systems Manager
