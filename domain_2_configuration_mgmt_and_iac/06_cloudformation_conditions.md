# CF Conditions
- Conditions are used to control the creation of resource sor outputs based on a condition

- Condtions can be whatever you want them to be, but common ones are:
Env, AWS Region, any parameter value

## How To define a condition
```yaml
Conditions:
    CreateProdResources: !Equals [!Ref EnvType, prod]
```
`Fn::`
- And
- Equals
- IF
- Not
- Or

In use
```yaml
Resources:
    MountPoint:
        Type: AWS::EC2::VolumeAttachment
        Condition: CreateProdResources
```