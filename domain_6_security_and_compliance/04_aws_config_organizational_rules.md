# AWS Config Organizational Rules
- AWS Config Rule that you can amange across all accounts witin an AWS Organization
- Looks similar to conformance packs, and yes it is similar

## Difference
Organization Rules
- Scope: AWS org
- Evalaution type:  evalautes resoruce against predefined rules and enforced at an org level
- Rules Count: one rule (at a time)
- comlpiance Level:  managed at the org level

Conformance Packs
- Scope: aws accounts and orgs 
- Evalaution type: evlauate resoruces against predefined rules tha are defined and enforced at the account level
- Rules Count: many rules at a time
- comlpiance Level:  manged at the account level