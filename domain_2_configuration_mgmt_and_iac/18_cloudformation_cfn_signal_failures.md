`EXAM`
# Wait Condition Din't Receive The REquired Number of Signals from an EC2 Instance
Potential Reasons
- AMI Doesn't have the AWS Cloudformation helepr scripts isntalled. If the AMI doesn't have it, download them
- Verify `cfn-init` & `cfn-signal` command was successful run on the instance. Can view logs on `/var/log/cloud-init.log` or `/var/log/cfn-init.log` to help you debug launch instance
- Look at logs in your EC2 instance directly but you need to disable rollback on failure or else AWS CF deletes the instance after your stack fails to create 
## the above is important bc CF will delete your instance so yo ucan't view the logs
- Make sure the EC2 instance has access to the internet esp if it is launched in a private subnet, use `curl -l https://amazon.com` as an example test