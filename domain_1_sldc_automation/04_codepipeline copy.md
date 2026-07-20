# AWS CodePipeline
- visualworkflwo for CICD orchestration
- source codecommit, ecr, s3, github etc
- build codebuild, jenkins, cloudbees, teamcity etc
- test codebuild, aws device farm, 3rd party tools
- deploy, codedeploy, elastic beanstalk, cloudformation, ecs, s3
- invoke - lambda, step functions


Conssits of stages:
- stages can have sequential or aprallel actions
- i.e. build-test-deploy-load testing
- manual approval can be defiend at any stage

# CodePipline - Artifacts
- each pipeline stage can create artifacts
- artifcats stored in an S3 bucket passed onto the next stage
i.e. CodeCommit outputs ot S3, Codebuild takes input from S3 then outputs artifact to S3, CodeDeploy then inputs the artifact for deployment

# Troubleshooting
- CloudWatch Events (EventBridge)
- can ceate events for failed pipelines
- can create events for cancelled stages
- If pipelien can't perform action make sure the IAM Service Role has enough permissions
- CloudTrail can be used to adut AWS API calls still

# Hands On
can integrate with Github for example with a certain trigger

For example watch repo `ABC` and on push to `main` run the pipeline and `Deploy` to `Elastic Beanstalk` -> dummy environment

In this example pipeline, we can add a stage called `DeployToProd`
We can add an `Action Group` of action provider type `AWS Elastic Beanstalk`
And since it is prod we can add a manually approval action inside that stage
