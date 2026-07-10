# ECS Logging
- containers send application lgos directly to CW logs
- you need to turn on `awslogs` driver for CW logs
- configure `logConfigruation` parameter in your Task Definition
- For the Fargate Launch Type
    - Task execution role must have the requried perms to deal with CW
    - supports awslogs, splunk, awsfirelens log driver
- ECS Launch Type
    - prevents logs from taking up disk space on your container EC2 instances
    - uses CW unified agen & ECS container agent
    - enable logging using `ECS_AVAILALBE_LOGGING_DRIVERS` in `/etc/ecs/ecs.config`
    - Container EC2 instances must have permissions

### ECS Logging with Sidecar Container
- Separater container, responsible for collecting all logs and files on the file system and sends the logs to log storage