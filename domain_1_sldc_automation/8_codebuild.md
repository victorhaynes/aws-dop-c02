# AWS CodeBuild
- Source - CodeCommit, s3, Bitbucket, GitHub
- Build instructions `buildspec.yml` (`EXAM` file located at the root)
- Output logs can be stored in S3 or CloudWatch Logs
- Use CloudWatch Metrics to monitor build statistics
- Use EventBridge to detect failed builds and trigger notifications
- Use cloudWatch Alarms to notify if you need "tresholds" for failures

- Build Projects can be defined within CodePipeline or CodeBuild

## Supported Envs
Java, ruby, python, go, node.js, android, .net core php, docker -> extend the environment yourself

## CodeBuild how it works
- CodeCommit sourcode, at the root there is a `buildspec.yml`file `EXAM`
- contains the instructions
- codebuild will either pull a prepackaged container or you can provide your own
- instructions can run long, can cache some files in s3 to speed up reruns
- logs can be stored in S3 or CloudWatch Logs

## `buildspec.yml`
- at root
- `env` allows you to define environment variables `env.variables` in plaintenxt, from SSM values from parameter store, from variables stored in AWS secrets manager
- `phases` - specify commands to run
- `phases.install.commands` install dpendencies needed for build
- `phases.prebuild.commands` final commadns to execute before build
- `phases.build.commands` actual build commands
- `phases.post_build.commands` clean up/finishing touches
- `artifacts` what to upload to S3 (KMS encrypted)
- `cache` files to cache (usually dependencies) to S3 for future build speedup

## CodeBuild Local Build
- in case of need of deep torubleshooting beyond logs
- can run locally on desktop (with docker)
- need codebuild agent

## CodeBuild Inside VPC
- CodeBuild containers are outside your VPC by default (cannot access VPC boun resources)
- You can specify VPC configuration VPC, subnet, security groups etc
- then your builds can access resouces in your VPC (i.e. RDS, elsaticache, ec2, alb)
- good for integration tests, data query, internal load balancers etc

# Hands On
