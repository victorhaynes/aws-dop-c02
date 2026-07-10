# CF Custom Resources
- define rsources not yet supported by CloudFormation
- define custom provisioning logic for external resoruces
- have custom scripts ran during CF CRUD
`EXAM` common example is run a lambda function to empty an S3 bucke before deletion

- Defien in the tempalte using
```
AWS::CloudFormation::CustomResource
```
or recommended
```sh
Custom::MyCustomResourceTypeName
```

## How to define a CR
- `ServiceToken` specifies whre Cloudformation sends reuests to, such as a Lambda ARN or SNS ARN (Required & must be in the same region)
- This is an example for Lambda
- Input data params are optional
```yaml
ResourceS:
    MyCustomResourceUsingLambda:
        Type: Custom::MyLambdaREsource
        Proeprties:
            ServiceToken: arn:aws:REGION:account_ID:function:FUNCTION_NAME
            # input values (optional)
            ExampleProperty: "ExampleValue"
```


## Hands On
Develop a template for that custom Resource

CF will use the template and will send a request contains S3 pre-signed URL for response, CF listens at a temporary S3 bucket, `SNS or Lambda` in our case will respond to that temporary S3 bucket