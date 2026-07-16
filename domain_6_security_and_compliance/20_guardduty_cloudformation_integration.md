# GuardDuty CloudFormation Integration
- You can enable GD using a CF template
- If GD is already enabled, the CF stack deployment fails
- Use CF Custom Resorucce (Lambda) to conditionally enableGD if it is not already enabled
- Can the ndeploy across all the organization using a stack set

`EXAM` - the point is GD enablement is not idempotent, so make a lambda function (CF custom resource) that will do a if/else check