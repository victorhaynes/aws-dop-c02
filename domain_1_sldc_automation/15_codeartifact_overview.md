# AWS CodeArtifact
- software packages depend on each other to be built (dependencies), and new ones are created 
- storing and retrieving these dependencies is called artifact management
- traditionally you need to setup your ow nartifact management system
- `CodeArtifact is a secure scalable and cost effective artifact management for software dev
- works with commons tools like Maven, Gradle, npm, yarn, twine, pip, NuGet etc
- Devs and CodeBuild can then retrievew dependencies straight from CodeArtifact

# TLDR
All Artifacts will live inside your VPC
- made up of Domains
- Domains have a set of repostories
- CodeARtifact is a proxy for a public Artifact Repository like `npm`
- benefit of network security
- code artifact can keep a copy of public artifacts
- you can also upload your own artifacts into the repo
- instead of devs running npm or pip, CodeBuild can pul from CodeArtifact itself also

## CodeArtifact Event Bridge Integration
- CodeARtifact ->EventBridger-> Lambda/Step Functions/SNS/SQS/CodePipeline->CodeCommit->Codebuild->CodeDeploy


## Resource Policy
- A given principal (person for example) can either read all package in a repository or none of them
- auth is at a REPO level `Exam` 
- especially noteworthy for cross-account access
