# ECR Extras

### Lifecycle Policies
- Auto remove old or unusage images based on age or count
- i.e. keep 1 untagged image and expire all other ones
- rules are evaualted at the same time hten applied based on priority
- Images are expired within 24 hours of meeting criteria
- Helps reduce storage costs


### Uniform Pipeline
I.e.
[CodePipeline]
Can standardize images from a deployment POV

CodeCommit -> Codebuild -> push standardized container