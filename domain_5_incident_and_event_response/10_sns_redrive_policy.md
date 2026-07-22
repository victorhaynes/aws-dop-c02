# Amazon SNS Redrive Policy
- `Must be enabled`
- `Redrive Policy` - JSON object that refers to the ARN of the DLQ (SQS or SQS FIFO)
- DLQ is attached to SNS susbcription-level (rather than at the SNS topic level) `EXAM`

so if an SNS topic has a HTTP subscriber and a Lambda subscriber then you need a DLQ for both if you want symmetry