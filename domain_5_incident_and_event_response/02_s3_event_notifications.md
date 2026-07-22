# Amazon S3 Event Notifications
- i.e. S3:OBjectCreated, S3:ObjectRemoved etc
- can fitler something like only for *.jpg objects
- Use case: generate thumbnails of all .jpg files uploaded to S3

S3 events can target SNS, SQS, or Lambda

If you want S3 to integrate with SNS then S3 (or SQS or Lambda) needs a resource access policy that allwos s3 to call it

`reminder`
`IAM policies` are for idenities (does not require a prinicipal, I am the principal)

`resource-based policies` are for resources (a service itself, i.e. requires a principal, WHO does this apply to)

This is basically legacy, pre-EventBridge utilities but are still in use

## You can also just use EvenBridge
EB capures all of this anyways