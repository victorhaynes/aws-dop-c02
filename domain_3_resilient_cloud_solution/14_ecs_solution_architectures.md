# ECS Solution Architectures

### ECS tasks invoked by Event Bridge
- Users upload to S3 -> eventbridge -> rule: run ECS task -> task gets an ECS Task Role and does some processing -> saves result to DynamodDB

For serverless S3 object proccesing using a docker container pattern