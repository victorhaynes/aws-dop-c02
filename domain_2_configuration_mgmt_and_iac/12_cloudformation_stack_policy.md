# CF Stack Policies
- During a CF Stack update all actions are allowed on all resources (`default`)
- sometimes you want to protect parts of the stack against updates
- use a `JSON` document that defines the update actions that are allowed on a specific resource

I.e. don't alter the prod database "LogicalResourceId/ProductionDatabase"

so we don't accidentally messs it up, use an explicit ALLOW
`EXAM`

# CF Termination Protection
- To protect against accidedntal stack deletions
- Off by default
- can toggel it on in the UI