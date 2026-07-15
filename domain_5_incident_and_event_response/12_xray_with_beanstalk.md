# AWS X-Ray with Elastic Beanstalk
- Elastic Beanstalk platforms incldues the X-Ray daemon
- You can set this in the console
    or create a manual config file
    ```yaml
    option_settings:
        aws:elasticbeanstalk:xray:
            XRayEnabled: true
    ```
- Make sure to give your instance profile the correct IAM permissions so that the X-Ray daemon can function correctly
- Then make sure your application code is instrumented with the X-Ray SDK
- Note the X-Ray daemon is not provided for multicontainer docker
