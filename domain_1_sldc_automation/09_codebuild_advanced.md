## CodeBuild - Environment Variables
`Default`
- AWS_DEFAULT_REGION
- CODE_BUILD_ARN
- CODEBUILD_BUILD_ID

`Custom`
- Static, defefined at build time (override using start-build API call)

`Dynamic`
- pulled from SSM Parameter Store or Secrets Manager

## Codebuild - Security
- Codebuild Service Role allows CB to access AWS resoruces on your behalf
i.e. download CodeCommit code, upload to S3
- in transit and at rest encryption
- build output artifact encryption

## Build Badges
- Dynamically generated badge that displays the status of the latest build
- can be accessed through a public URL
- Supported for codeCommit, Github, bitbucket
- badges avaialble at the branch level

## CodeBuild Triggers
Multiple ways...

CodeCommit->EventBridge->trigger CodeBuild

CodeCommit->EventBridge->Lambda->trigger Codebuild

Github->Webhook->CodeBuild

## CB Validate PRs
- Validate proposed code changes in PRs before they get merged
- Ensure high level of code quality and avoid code conflicts

## CodeBuild Test Reports
- self explanatory
- contians details abotu tests that are run during builds,
- unit tests, config test, func test
- Reports can be in JUnit XML, NUnit XML, NUnit3 XML, Cucomber JSON, TestNG XML, Visual Studio TRX
- Create a test report and add a `Report Group` name in the `buildspec.yml` file with information abotu your tests