# Beanstalk Extras

Web Server type of deployment
- Serve web pages

If you have taks that are logn to complete, offload these tasks to a dedicated worker environment
- called decoupling
- i.e. processing a video or generating a zip file, cna define periodic tasks in a `cron.yaml` file

I.e. Web Tier = ELB + ASG/EC@ ->

PUT

Worker Tier = SQS + EC2

# Notifcations
- Create Rules in EventBridge to act to the following events
- Environment Operations Status - create, update, termiante (start, success, fail)
- Other Resources Status 
- Managed Update Status
- Environment Health Status

