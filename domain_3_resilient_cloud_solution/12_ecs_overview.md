# Amazon ECS

### ECS EC2 Launch Type
ECS = Elastic Container Service
- Launch Docker containers on AWS = Launch ECS Tasks on ECS Cluster
- EC2 Launch Type you must provision & maintain teh ifnra (the EC2 instance)
- each agent must register the `ECS Agent`
- instances provisioned in advanced


### Fargate Launch Type
- Launch Docker containers on AWS
- Serverless / no manual provisioning
- Just create tasks definition
- AWS just runs ECS Taks based on the CPU / RAM you need
- To scale, just increase the number of tasks. Simple - no more EC2instance
- exam has a bias for Fargate, it is easier to use in general

### IAM Roles for ECS
EC2 Isntance Profile (only for EC2 launch Type only)
- used by the ECS agent
- agent uses this profile to interactio nwith ECS/ECR/CloudWatch Logs/SSM etc.

ECS Task Role
- each task has a spcific role
- task role is defined in the task definition
Task A
- task A role for S3
Task B
- task B role for ECR etc

### Load Balancer Integrations
- Ex. Run an `ALB` in front of our ECS cluster which contains multiple instance and multiple ECS tasks
- supports most use cases

- `Network Load Balancer` only for high throughput, high perforamnce, or with AWS Private Link

- `Classic Load Balancer` legacy, like an ALB but deprecated and doesn ot work with Fargate

### Data Volumes (EFS)
- Mount EFS file systems onto ECS tasks to share data
- Use AWS EFS--works with both EC2 and Fargate launch typs
- Tasks running in any AZ will share teh same data i nthe EFS file system
- serverless = Fargate + EFS 

- Use cases: persistent multi-AZ shared torage for your containers

- `Note: S3 CANNOT BE USED AS A FILE SYSTEM FOR ECS TASKS` it is not a file system