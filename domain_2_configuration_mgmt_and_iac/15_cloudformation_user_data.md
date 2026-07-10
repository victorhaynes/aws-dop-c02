# User Data in CF
- Pass the entire user data script through a function called Fn::Base64

- Good to know: user data script log is in 
```
/var/log/cloud-init-output.log
```

```yaml
Resources:
    MyEc2Instance:
        Type: AWS:EC2:Instance
        Properties:
            ...
            UserData:
                Fn::Base64 : |
                #!/bin/bash -xe
                dnf update -y
                dnf install -y httpd
                systemctl start httpd
                systemctl enable httpd
                echo "<h1>Hello World from user data</h1>" > /
                var/www/html/index.html
```

# Note by default, CF does not care about success of User Data script unless you link it