# Auto Scaling Groups Lifecycle Hooks
- By default as soon as an instancei s lanuched in an ASG it's in service
- you can perform extra steps before the is instance goes ins ervice (pending state)
    - i.e. have instance run some script
    - use `EC2_Instance_Launching` Lifecycle Hook
- You can perform some actions when the instance is terminated
    - i.e use `EC2_Instance_Terminating` state to capture logs, cleanup or do whatever business logic
- Integration with EventBridge, SNS, and SQS