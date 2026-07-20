# CF Instrinsic Functions
`EXAM`
- `!Ref`
- `Fn::GetAtt`
- `Fn::FindInMap`
- `Fn::ImportValue`
- `Fn::Base64`
- Condition Functions (- `Fn::If`, - `Fn::Not`, - `Fn::Equals`, - `Fn::Or` etc)

Others
- Fn::Join
- Fn:Sub
- Fn:ForEach
- FnToJsonString
- Fn::Cidr
- Fn::GetAZs
- Fn::Select
- Fn:Split
- Fn::Transform
- Fn::Length

## Fn::Ref
get a reference
- of a parameter, get the value
- of a resource, get the physical ID of an underlying resource
- short hand of  `!ref`

## Fn::GetAtt
All resoruces have attributes
Docs specify which attrs a resource has
I.e. an `Ec2 Instance` might have a `PublicIp` or a `PrivateDnsName`

```yaml
ResourceRecords:
- !GetAtt EC2Instance.PublicDnsName
```

## Fn::FindInMap
we saw this already

## Fn::ImportValue
Import values that are exported in other stacks
Names must be unique within a region & account

## Fn::Base64
Convert String to it's BaSe64 representation
- ex. 
```yaml
!Base64 "ValueToEncode"
```

- Example: pass encoded data to EC2 Instance's UserData property, `EXAM` common use case
```yaml
Resources:
    WebServer:
        Type: AWS::EC2::Instance
        Properties:
        ...
            UserData:
                Fn::Base64: |
                #!/bin/bash
                dnf update -y
                dnf install -y httpd
```

## Fn::Condition Functions
seen this before
