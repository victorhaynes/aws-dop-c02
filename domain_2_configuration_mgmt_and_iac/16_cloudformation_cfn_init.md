# The problems with EC2 User Data
- what if we want to have large instance config
- What if want to evolve the state of the EC2 instance without terminating it and creating a new one?
- How do we make it more readable?
- How do we know it compelted OK?

Enter `CloudFormation Helper Scripts`
- Python scripts that come directly on Aamzon Linux AMIs (can also be isntalled with yum or dnf)
- cfn-init
- cfn-signal
- cfn-get-metadata
- cfn-hup

# cfn-init

### AWS::CloudFormation::Init
A `config` contains the following and is exdecuted in that order


- `Packages` used to download and install pre-packed apps and components
- `Groups`: define user groups
- `Users`: define users/group membership
- `Sources`: download files
- `Files`: create files on the EC2 Instance using inline or pulled from a URL
- `Commands`: run a series of commands

## CF - cfn-init
- Python script used to retrieve and interpert the resource metadata, isntall apckages, creating files and starting services
- with `cfn-init` script it helps make complex EC2 config readable
- The EC2 instance will query the CF service to get init data
- `AWS::CloudFormation::Init:` must be in the Metadata of a resouce
- logs go to `/var/log/cfn-init.log`

```yaml
Resources:
    MyEc2Instance:
        Type: AWS:EC2:Instance
        Properties:
            ...
            UserData:
                Fn::Base64 : |
                !Sub |
                #!/bin/bash -xe
                # Get the latest CloudFormation package
                dnf update -y aws-cfn-boostrap
                # Start cfn-init
                /opt/aws/bin/cfn-init -s ${AWS::StackId} -r MyInstance --region ${AWS::Region} || error_exit 'Failed to run cfn-init'
        MetaData:
            Comment: Install a simple Apache HTTP page
            AWS::CloudFormation::Init:
                config:
                    packages:
                        yum:
                            http: []
                    files:
                        "/var/www/html/index.html":
                            content: |
                                <h1>Hello World from EC2 Instance!</h1>
                                <p>This was created using cfn-init</p>
                            mode: '00064'
                    commands:
                        hello:
                            command: "echo 'hello world'"
                    services:
                        sysvinit:
                            httpd:
                                enabled: 'true'
                                ensureRunning: 'true'
```

This is kind of like ansible but CF/EC2 native