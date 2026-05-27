# Section 7: Domain 5 - Incident and Event Response

## What this section covers

This section is about detecting important events, routing them, auditing them, and reacting automatically.

## 1. EventBridge

- EventBridge is the central event-routing service.
- It handles:
  - service event patterns
  - schedules / cron-like triggers
  - rule-based target invocation
- Common targets include:
  - Lambda
  - SNS
  - SQS
  - Kinesis
  - Step Functions
  - CodePipeline
  - CodeBuild
  - SSM automation
  - EC2 actions

## 2. Event buses and schemas

- EventBridge supports:
  - `default event bus`
  - `partner event bus`
  - `custom event bus`
- `Schema Registry` helps infer and version event schemas and generate code bindings.
- Resource-based policies on event buses enable cross-account event flows.

## 3. Event filtering and transformation

- EventBridge rules can filter deeply on event content.
- Matching patterns include things like:
  - exact match
  - prefix/suffix match
  - anything-but
  - numeric matching
  - IP/CIDR matching
  - existence matching
- `Input Transformation` rewrites event payloads before delivery to the target.
- This is useful when a target expects a simpler or differently shaped message than the raw event.

## 4. S3 events and object integrity

- `S3 Event Notifications` can trigger downstream workflows from bucket object actions.
- Typical targets are Lambda, SNS, and SQS.
- `Object Integrity` topics matter for validating object correctness and handling integrity-sensitive workflows.

## 5. AWS Health Dashboard

- Health Dashboard emits both:
  - account-specific events
  - public service health events
- These can flow into EventBridge and trigger automation or notifications.
- Example use cases from the course:
  - alerting on scheduled maintenance
  - reacting to exposed IAM keys
  - restarting instances scheduled for retirement

## 6. EC2 status checks and automated recovery

- EC2 status checks identify:
  - system/hardware issues
  - instance/software/network issues
  - attached EBS health issues
- Responses differ by failure type:
  - system issue: often stop/start or recover
  - instance issue: often reboot or fix configuration
  - EBS issue: reboot or replace the affected volume
- Two recovery patterns:
  - CloudWatch alarm with `recover instance`
  - Auto Scaling replacement using an ASG of size 1

## 7. CloudTrail

- CloudTrail is the audit history service for AWS API activity.
- It is enabled by default for event history.
- Main event types:
  - `Management Events`
  - `Data Events`
  - `Insights Events`
- Important distinctions:
  - management events are operations on AWS resources
  - data events are high-volume object/function-level operations like S3 object actions or Lambda invoke activity
- For long-term retention beyond 90 days, store trails in `S3`.

## 8. CloudTrail Insights

- CloudTrail Insights detects unusual patterns in management activity.
- Useful for spotting:
  - unusual API bursts
  - strange provisioning behavior
  - unusual IAM activity
- Insights can also feed EventBridge for automated response.

## 9. CloudTrail and EventBridge together

- CloudTrail can supply event detail that EventBridge rules consume.
- This is the standard pattern for event-driven response to AWS API actions.
- Good example:
  - detect sensitive API activity
  - route to EventBridge
  - notify or remediate automatically

## 10. Dead-letter handling

- `SQS Dead Letter Queues` are included here because failed processing paths are part of incident handling.
- DLQs preserve failed messages for analysis instead of losing them silently.

## What to memorize for DOP-C02

- EventBridge replaced the old CloudWatch Events branding.
- EventBridge supports default, partner, and custom buses.
- Event buses can use resource-based policies for cross-account publishing.
- Schema Registry is an EventBridge feature, not a CloudTrail feature.
- CloudTrail event history is 90 days.
- `Management Events` and `Data Events` are different and commonly tested.
- CloudTrail Insights is separate, paid, and focused on unusual activity detection.
- EC2 `recover` via CloudWatch alarm is different from simple reboot or ASG replacement.

## Lecture map

- Lectures 186-189: EventBridge
- Lectures 190-192: S3 event notifications and object integrity
- Lectures 193-195: AWS Health Dashboard
- Lectures 196-197: EC2 instance status checks
- Lectures 198-200: CloudTrail and CloudTrail/EventBridge integration
- Lecture 201: SQS dead-letter queues
