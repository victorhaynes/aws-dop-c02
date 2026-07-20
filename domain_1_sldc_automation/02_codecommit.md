## AWS CodeCommit
- Version control backed by `git` technology
- Typically integrated with a central online repo
- pro-collaboration
- view-ability, auditable
- code back ups

AWS Code Commit
- private git repos
- no size limit
- managed, highly available
- code only in AWS cloud account
- integration with security tools, jenkins, Codebuild etc

### Security
- can use standard `git` commands
### Authentication
- SSH Keys AWS Users can configure SSH keys in their IAM Console
- HTTPS with AWS CLI Credential helper or Git Credentials for IAM user
### Authorization
- IAM policies manage users/roles perms to repos
### Encryption
- auto, at rest, via AWS KMS
- Encrypted in transit, must use HTTPS or SSH

### Cross-account Access
- Use IAM role in your AWS account and use AWS STS Assume (AssumeRole API)


# Hands On Part 1
Just navigating the UI, uneventful so far
- can setup Notification Rules for the repo
- can set based on trigger (full or basic payloads available)
- i.e. on commit, on pr, on merge, on branch creation etc
- `Notifications`: Can integrate with `SNS topics`, then other consumers can susbcribe to that topic
- `Triggers` on code Events (all repos, push to existing branch, create branch or tag, delete branch or tag) are meant to kick off actual work...can trigger SNS or Lambda

# Hands On Part 2
- went over basic git func I already know