### Code Commit Advanced
- Can monitor CoddeCommit events in event bridge near real time
- PR created, PR status change, ref created, comment on commit created etc
- react

CodeCommit -> EventBridge -> AWS/SNS/CodepipeLine/Lambda

### Cross Region Replication
- use case: achive lower altency pulls for global developers, backups

- Ex.
[us-east-1] Repostory A
`CodeCommit` -> referencedCreated EVENT -> streamed to `EventBridge` -> invokes `ECS Task` -> ECS runs `git remote set-url--push origin https://git-codecommit.eu-west-2.amazonaws.com/v1/repos/Repository_B` -> targetting [eu-west-2] CodeCommit Repository B instance


## Branch Security
- When a user has push permissions to arepo, they can sue any branch
- IAM policies can restrict push to merge code to a speciic branch

### Codecommit PR Approval Rules
- ensures quality of code by requriring users to approve PRS before code can be merged
- specify a pool of users to approve and the number of users who must approve the PR (i.e. pool of 5, need 2 approvals)
- Specify IAM Principal ARN 
- Approval Rule Templates--for any PR on a branch

