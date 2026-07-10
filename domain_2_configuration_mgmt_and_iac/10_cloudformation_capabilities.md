# CF Capabilities
- `CAPABILITY_NAMED_IAM`
and
- `CAPABILITY_IAM`

Necessary to enable when you want CF tempalte to create or update IAM resources (to speciic akcnowledge the fact that CF is going to alter IAM resources)

- `CAPABILITY_AUTO_EXPAND`
ackwnoelding that template my change before deploying
- encessary when your CloudFormation tempalte incldues MAcros or NEsted stacks (stakc within stacks) to perform dynamic transformation

- `InsufficientCapabilitiesException`
Will be thrown by CF is the capabilities haven't been acknowledged when deploying a template (security measure)

