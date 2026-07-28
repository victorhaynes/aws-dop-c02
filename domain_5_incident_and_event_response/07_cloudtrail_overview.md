# AWS CloudTrail
Provides governance compliance and audit

enabled by default

All Console, SDK, CLI, AWS Services (all API calls in your account)

Can put logs into CW Logs or S3
- A trail can eb applied to all regions (Default) or a single Region

- If something got deleted unexpectedly and you need to investigate CloudTrail is a great place to start

`If we want more than 90 days of storage then put them in CW Logs or S3`

## CouldTrail Events

`Management Events`
- operations that are performed on resources in your AWS account

Examples:
- configuring security
- netowrk rules
- logging
- by default trails are configured to log all maangeemnt events
- can separate read events (no-mod) from write events if you want to

`Data Events`
- by default events are `not logged `(becasue high volume operations)
- surprisingly, things like S3 object level activity (GetObject, DleteObject,PuObject) if you want this you need to turn it on
- Can separate writes from reads
- AWS lambda functio nexecution activity (the Invoke API)

## CloudTrail Insights Events
- can be difficult to understand what looks odd or unusual 
- enable/pay
- will try to detect unusual activity in your account automatically
- inaccurate resource provisioning
- hitting service limits
- bursts of AWS IAM action
- gaps in periodic maintenance

Analyzes normal mangement events to create a baseline

Continuously analyzes `write` events to detect unusual behavior

## CloudTrail Events retention
- Events are stored for 90 days in CloudTrail by default
- To keep events beyond this period, log them to S3 and use Athena if you want to analyze them