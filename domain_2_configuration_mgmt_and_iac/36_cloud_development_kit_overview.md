# AWS Cloud Development Kit (CDK)
- Define cloud infra in a familiar language
- This is basically JS/TypeScript/Python/Java and .NET but

- Contains high level components called constructs
```ts
const vpc = new ec2.Vpc(this, "MyVpc", {
    maxAs: 3 // default is all AZs in region
});
```
- If the code compiles it can get compiled into JSON or YAML
- You can therefore deploy infrastructure and applicatio nruntime code together
- Great for Lambda functions
- Great for Docker containers in ECS / EKS
- Gain type safety

People call this superior

## CDK vs SAM
SAM
- serverless focused
write your tempalte declaratively in JSON or YAML
- great for getting started with Lambda
- Leverages CloudFormation

CDK
- All AWS services
- use the language you prefer
- built on top of CDK

## CDK + SAM
- Can use SAM CLI to locally test your CDK apps
- must run `cdk synth`
- generaets a local generate template


## Hands On
Goal use CDK to create S3 bucket, aws Lambda trigger, amazon rekognition to analyze the results, save reults to dynamoDB

1. Install the CDK
```sh
sudo npm install -g aws-cdk-lib
```

Change dir to desired place

2. Initialize the application
```sh
cdk init app --language javascript
```
Verify it works
```sh
cdk ls
```
3. 
```sh
# copy the content of the cdk-app-stack.js into the lib/ dir
```
Just watch the hands on...it's a provide JS CDK stack
