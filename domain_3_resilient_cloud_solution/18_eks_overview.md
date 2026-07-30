# Amazon EKS
- Amazon EKS = Amazon Elastic Kubernets Services
- Manageds k8s cluster on AWS
- Alternative to ECS but different API
- k8s is open source while ECS is not

- EKS supports `EC2` if you want to deploy worker nodes or `Fargate` to deploy serverless containers
- Use case: already on k8s and wants to use AWS to managed k8s
- k8s is cloud agnostic `EXAM` great fo migration

### EKS Diagram
Worker nodes (some amount in each AZ in their own subent inside the same VPC)

### EKS Node Types
Managed Node Groups
- AWS creates and manages Nodes (EC2 instances) for you
- Nodes are part of an ASG managed by EKS
- Supports On-Demand or Spot instances

Self Managed Nodes
- nodes created by you registed to the EKS cluster and managed by an ASG
- on demand or spot
- chose your ami

AWS Fargate
- no maintenances

### EKS DataVolumes
- need to specify a `StorageClass` manifest on your EKS clsuter
- Leverages a `Container Storage Interface (CSI)` `EXAM` compliant driver

Supports EBS, EFS (with Fargate), FSx for Lustre, FSx for NetApp ONTAP