# CloudFormation Resources
- the cloud resource s in a CF template (this si the only mandatory field)
700+ resource types


How to identify the resources:

`service-provider::service-name::data-type-name`

I.e. `AWS::EC2::Instance`

For EC2 Instances, some properties being changed require stops/restarts, some don't (such as instance name), other require replacement on change (such as the AMI)

## CF FAQ
- can you make dynamic number of resources? YEs using CF Macros and Transform, but outside of scope fo this course

- Is every Service supported? Almost
- The workaround for unsupported resoruces is `Cloudformation Custom Resources`

