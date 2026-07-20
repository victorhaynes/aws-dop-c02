# AWS Lambda Versions and Aliases
- when you work on a lambda function we work on `$LATEST` (mutable)
- When we are ready to publish a lambda functio nwe create a version
- Versions are immutable
- Versions have increasing version numbers
- Versions get their own ARN 

Version = code + config (immutable)

Can access diff versions or acessed

What if we want a stndard endpoint for a end user?
## Lambda Alias
- Solution
- These are pointers to lambda function verions
- can define a dev alies -> $LATEST
- test -> V2 (some experiment)
- prod -> V1 (stable and working)

We can then use a canary deployment to assign weights between V1 and V2 (i.e. 95 v1 and 5 v2)

Aliases have their own ARNs
- Aliases cannot refeernce other aliases, only versions `EXAM`