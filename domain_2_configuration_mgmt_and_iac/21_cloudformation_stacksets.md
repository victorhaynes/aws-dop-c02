# WARNING
Just a note about how the CRUD up coming costs a lot of money, so jsut watch the next lextures

# CF StackSets
- CRUD stacks across multipel accounts and regions with a single operation template
- Admin acccount creates stacksets
- Target accounts to perform crud from StackSets
- When you update a stackst, all associated stack isntances get updated

# CF StackSets Permission Models
Amin account vs target Account
- Create IAM roles with trust relationship in both admin and target account
`Admin Acct - AWSCloudFormationStackSetAdminstrationRole`
`Target Account - AWSCloudFormationStackSetExecutionRole`
configure the baove manually

If you are using AWS Organizations these will be created automatically
- must enable all features in Orgs

# StackSets within AWS Orgs
- abiltiy to automatically deploy tack isntances to new accoutns in an AWS org
- Can delegate StackSet administration to member accounts in AWS
- Trusted access with AWS Organizations msut be enabled before delegated adminsitraors can deploy to acocuntsm anaged by Organizations

# Summary
- The AWS Org itself
- A Delegated Admin account manages a StackSet
- That Stackset may get deployed to a Prod OU and a Dev OU
- If we add a new account to a OU the StackSet CAN be deployed automatically if desired