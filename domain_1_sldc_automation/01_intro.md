## Continuous Integration (CI)
- Code pushed often to repo (GitHub, CodeCommit, Bitbucket)
- Test / build server that checks as code as soon as it is pushed (CodeBuild/Jenkins CI etc)
- Develoepr gets feedback
- Finds bugs early
- deliver faster
- deploy often

## Continuous Delivery (CD)
- Ensures that software can be released reliability whenever needed

Dev ->.code repo -> build server (CI) -> deployment server (CD) -> new application deployed

- shift away from "one release every 3 months" to "multiple releases a day"
- needs auto deployment tool (CodeDeploy, Jenkins CD, Spinnaker)

## Technology Stack for CICD

### AWS POV:

- AWS CodeCommit (code repo | GitHub)
- AWS CodeBuild (CI | Jenkins CI)
- AWS CodeDeploy (CD | Jenkins CD) -> can deploy to EC2, on-prem, Lambda, ECS, Elastic Beanstalk etc
- Can also deploy using Elastic Beanstalk & provision infra

### Orechestration
- AWS CodePipeline