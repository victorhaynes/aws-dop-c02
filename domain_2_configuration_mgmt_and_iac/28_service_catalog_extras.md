# Service Catalog Extras

`EXAM`
## Stack Set Constraints
- allow you to configure Product deployment options using CloudFormation StackSets
- Accounts - identify AWS accounts where you want to create `Products`
- Regions (regions to deploy)
- Permissions

## Launch Contraints
- IAM Role assigned to a Product which allows a user to launch, update, or terminate a product with minimal IAM permissions
- A launch constraint is an IAM Role with full CF Access, S3 bucket which contains the CF template (read), AWS Services in the CF template

## Continuous Delivery Pipeline (Syncing with CodeCommit)
- CodeCommit (product-a.yml)
- triggers Lambda
- runs CRUD on the Service Catalog

Basic synchronization flow