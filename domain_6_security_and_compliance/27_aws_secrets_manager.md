# AWS Secrets Manager
- Neweer service, meant for storing secrets
- different from Param store
- Capablity to force rotation of secrets every X days
- Automate generation of secrets on rotation (uses Lambda)
- Moreover secrets manager is will integrated with RDS, Aurora etc
- Secrets encrypted using KMS

`EXAM` secrets? rds? aurora integration? think Secrets Manager

## Mult REgio Secrets
- Replicate secrets across multiple AWS regions
- Secrets maanger keeps read replicas in sync with the primay secret
- ability to promote a read replica secret to a standaloen secret
- use cases: multi region apps diaster recovery strats, multi region DB