# CF Nested Stacks
- stacks within other stacks
- Can isolate repeated patterns and call them from other stacks (i.e. reusable load balancer configuration, security group re-using)
- Best practice
- nested stacks can nest other stacks
- to update a nested stack, always update the parent `root` stack

This is like TF modules

# cross stacks vs nested stacks
Cross Stacks
- Helpful when stacks have differnt lifecycles
- I.e. VPC stack -> App Stack
- Output VPC values, `Fn:ImportValue` values into App Stack

Nested stacks
- helpful when components must be re-used
- Good for re-use and common configuration

Remember nested stack files are uploaded in S3
```yml
AWSTemplateFormatVersion: '2010-09-09'
Description: Parent stack

Resources:
  ChildStack:
    Type: AWS::CloudFormation::Stack
    Properties:
      TemplateURL: https://my-bucket.s3.amazonaws.com/child.yaml
      Parameters:
        InstanceType: t3.micro

Outputs:
  ChildBucketName:
    Value: !GetAtt ChildStack.Outputs.BucketName
```
```yml
AWSTemplateFormatVersion: '2010-09-09'
Description: Child stack

Parameters:
  InstanceType:
    Type: String

Resources:
  MyBucket:
    Type: AWS::S3::Bucket

Outputs:
  BucketName:
    Value: !Ref MyBucket
```