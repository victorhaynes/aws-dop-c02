# SSM Session Manager
- Start a secure shell environment on EC2 or on prem
- access through AWS console, AWS CLI or Session Manager SDK
- Does not need SSH access, bastion hosts, or SSH keys

EC2 instance runs the SSM agent, has correct IAM permissions, user has IAM permissions also

Same mechanism as the run command feature

- linux, mac, windows
- session logs/sonnections can be sent to s3 or cloudwatch logs

Can use tags to restrict this only for certain instances
You can even use IAM to restrict what commands a user can run