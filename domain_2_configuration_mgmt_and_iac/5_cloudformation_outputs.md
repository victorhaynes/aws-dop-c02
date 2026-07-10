# CF outputs
- Dekcares optional output values that we can import into other staqcks (if exported)
- Can view the outputs in the AWS console or in the AWS CLI
- Best way to collaborate across stacks

```yml
Outputs:
    StackSSHSecurityGroup:
        Description: The SSH Security Group for our Company
        Value: !Ref MyCompanyWideSSHSecurityGroup
        Export:
            Name: SSHSecurityGroup
```

### Cross-Stack reference
Using `Fn::ImportValue` function
```yaml
Resources:
    MySecureInstance:
        Type: AWS::EC2::Instance
        Properties:
            ImageId: ami-some-string-here
            InstanceType: t2.micro
            AvailabilityZone: us-east-1a
            SecurityGroups:
            - !ImportValue SSHSecurityGroup
```