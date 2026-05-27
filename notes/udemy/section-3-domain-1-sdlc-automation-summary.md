# Section 3: Domain 1 - SDLC Automation

## What this section covers

This section is the CI/CD foundation for the DOP-C02. The main story is:

- Store code in a repository.
- Trigger builds and tests automatically.
- Move artifacts through a pipeline.
- Deploy safely with controlled traffic shifting and rollback.
- Support package management, code review, image creation, and frontend deployment.

## 1. CI/CD foundations

- `CI` means developers push code frequently to a central repository and builds/tests run automatically.
- `CD` means tested code is delivered or deployed automatically through environments like dev, staging, and prod.
- Core AWS mapping:
  - `CodeCommit`: source control
  - `CodeBuild`: build and test
  - `CodeDeploy`: deployment
  - `CodePipeline`: orchestration
- Common exam theme: manual approvals exist to gate promotion into production.

## 2. CodeCommit

### What matters

- Private Git repository service integrated with AWS.
- Security is centered on `IAM`, `KMS`, `HTTPS`, and `SSH`.
- Cross-account access is typically done with `STS AssumeRole`, not by sharing Git credentials.
- Pull requests exist and can require approval rules.

### Operational points from the lectures

- You can connect with either:
  - `SSH keys for AWS CodeCommit`
  - `HTTPS Git credentials for AWS CodeCommit`
- Notification rules can publish to `SNS` or AWS Chatbot/Slack-style targets.
- Triggers can invoke `SNS` or `Lambda` on repository events.
- EventBridge can react to repository events like pull requests, comments, and reference changes.

### Exam notes

- Branch-level protection is enforced with `IAM policies`, not repository resource policies.
- Cross-region replication is not native push-button replication:
  - Use `EventBridge` on reference updates
  - Trigger compute such as `ECS` or `CodeBuild`
  - Clone and push to the target-region repo
- Pull request approval rules define:
  - who can approve
  - how many approvals are required

## 3. CodePipeline

### Core model

- CodePipeline is the visual workflow/orchestration layer for CI/CD.
- It supports source, build, test, approval, invoke, and deploy actions.
- Artifacts move between stages through `S3 artifact stores`.

### Triggering

- Preferred trigger model: `events`
- For GitHub, event-driven starts typically use a `CodeStar Source Connection`.
- Older/less preferred options:
  - `webhooks`
  - polling

### CloudFormation integration

- CloudFormation is a deploy action in CodePipeline.
- Typical safe pattern:
  - create change set
  - manual approval
  - execute change set
- Action modes to remember:
  - create/update stack
  - delete stack
  - replace failed stack
  - create/replace change set
  - execute change set

### Advanced points

- Parallel actions happen when actions share the same `RunOrder`.
- Manual approval action:
  - owner is `AWS`
  - action type is `manual`
- Approvers need permissions such as:
  - `codepipeline:GetPipeline*`
  - `codepipeline:PutApprovalResult`
- Multi-region pipelines require:
  - one `artifact store` per region with actions
  - service-role access to every artifact bucket
- CodePipeline can invoke:
  - `Lambda`
  - `Step Functions`
- EventBridge is used heavily for pipeline state and failure handling.

## 4. CodeBuild

### Core model

- Managed build/test service.
- The key file is `buildspec.yml`.
- The build runs inside a container using either:
  - an AWS-managed image
  - your custom Docker image

### High-value facts

- `buildspec.yml` should live at the repo root.
- Common buildspec sections:
  - `env`
  - `phases`
  - `artifacts`
  - `cache`
- `env` can pull secrets from:
  - `SSM Parameter Store`
  - `Secrets Manager`
- Outputs:
  - logs to `CloudWatch Logs` and optionally `S3`
  - artifacts to `S3`
- Build caching can use `S3` to speed repeated builds.
- For deep troubleshooting, CodeBuild can be reproduced locally with Docker and the CodeBuild agent.

## 5. CodeDeploy

### Supported targets

- `EC2 / on-premises`
- `Lambda`
- `ECS`

### Big ideas

- Can automate deployment speed and rollback.
- Main deployment styles:
  - `in-place`
  - `blue/green`
- The controlling file is `appspec.yml`.

### EC2 / on-premises

- Requires the `CodeDeploy agent` on target instances.
- Deployment groups can target:
  - EC2 tags
  - Auto Scaling groups
- If behind a load balancer, traffic can be blocked before update and restored after update.
- Common deployment configs:
  - `AllAtOnce`
  - `HalfAtATime`
  - `OneAtATime`
  - custom percentages
- Important lifecycle hooks:
  - `ApplicationStop`
  - `BeforeInstall`
  - `AfterInstall`
  - `ApplicationStart`
  - `ValidateService`
  - plus load-balancer traffic hooks like `BeforeAllowTraffic`
- Blue/green can be:
  - manual: you provision blue and green yourself
  - automatic: CodeDeploy clones an ASG setup

### Lambda

- Used to shift alias traffic from one version to another.
- Strategies:
  - linear
  - canary
  - all at once
- Hooks are Lambda functions, mainly around:
  - `BeforeAllowTraffic`
  - `AfterAllowTraffic`

### ECS

- Supports `blue/green` only.
- Requires:
  - a load balancer
  - a new task definition revision
  - an `appspec.yml` referencing that task definition
- CodeBuild often prepares:
  - the new container image
  - the new task definition
  - the appspec file
- Test listeners can send validation traffic before full cutover.

### Rollbacks and troubleshooting

- Rollback is actually a new deployment of the last known good revision.
- Automatic rollback triggers can include:
  - deployment failure
  - CloudWatch alarm
- Common issues:
  - invalid signature from time mismatch
  - agent not installed/running
  - missing IAM permissions
  - misconfigured ELB health checks in blue/green
- On ASG scale-out during deployment, new instances can temporarily come up on the old version until follow-on deployment updates them.

## 6. CodeArtifact

- Managed package repository service for dependencies.
- Important building blocks:
  - `repository`
  - `upstream repository`
  - `external connection`
  - `domain`
- A repository can have up to `10 upstream repositories`.
- A repository can have only `1 external connection`.
- Domains matter because they:
  - deduplicate package storage
  - centralize encryption with one KMS key
  - support cross-account sharing/policy control
- External connections can point to public ecosystems like:
  - `npm`
  - `PyPI`
  - `Maven`
  - `NuGet`
- Authorization tokens are temporary; the lecture calls out a `12-hour` token lifetime.

## 7. CodeGuru

- ML-powered service for:
  - `CodeGuru Reviewer`
  - `CodeGuru Profiler`
- Reviewer:
  - static analysis
  - best practices, bug detection, security findings, secret detection
- Profiler:
  - runtime performance insights
  - CPU and memory optimization
  - anomaly detection
- Nice exam detail:
  - CodeGuru Reviewer can detect secrets and suggest moving them into `Secrets Manager`.
- Lambda profiling can be enabled with the profiler agent and optional function decorator.

## 8. EC2 Image Builder

- Automates creation, validation, testing, and distribution of AMIs or container images.
- Image Builder flow:
  - build instance
  - build components
  - create image
  - test image
  - distribute image
- Can publish images to multiple regions and accounts.
- Can share images, recipes, and components with `RAM`.
- Useful pattern:
  - publish latest AMI ID into `SSM Parameter Store`
  - have `Lambda` update it after builds
  - let `CloudFormation` consume it as a dynamic reference

## 9. AWS Amplify

- Think of Amplify as a high-level developer platform for web/mobile apps.
- It can combine services like:
  - `Cognito`
  - `AppSync`
  - `API Gateway`
  - `Lambda`
  - `DynamoDB`
  - `S3`
- Connect source code from Git providers and deploy through the Amplify Console.
- Useful exam framing from the lecture:
  - Amplify is like a more specialized developer experience for web/mobile, roughly analogous to a high-level deployment platform.
- Branch-based deployments are important:
  - one Amplify deployment per branch
  - often mapped to different custom domains in `Route 53`

## What to memorize for DOP-C02

- `buildspec.yml` belongs to `CodeBuild`.
- `appspec.yml` belongs to `CodeDeploy`.
- CodePipeline artifacts live in `S3`.
- Multi-region CodePipeline needs one artifact store per region.
- CodeDeploy rollback redeploys the last known good revision.
- CodeDeploy ECS supports blue/green only.
- CodeDeploy Lambda shifts alias traffic between versions.
- CodeCommit branch restrictions are done with `IAM`.
- CodeArtifact domains deduplicate storage and centralize policy/encryption.

## Lecture map

- Lectures 5-10: CI/CD intro and CodeCommit
- Lectures 11-16: CodePipeline
- Lectures 17-20: CodeBuild
- Lectures 21-25: CodeDeploy
- Lectures 26-28: CodeArtifact
- Lectures 29-30: CodeGuru
- Lectures 31-32: EC2 Image Builder
- Lectures 33-34: Amplify
