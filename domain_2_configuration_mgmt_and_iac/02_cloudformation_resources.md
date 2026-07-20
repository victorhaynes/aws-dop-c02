# CloudFormation Resources
Delcarative AWS resource outlining
- Infrastructure as Code (IaC)
- can use SCM/Git for IaC code
- Each resource in a stack is tagged with an identifier so you can see how much as tack costs
- Can also estiamte cost based on CloudFormation template
- Can automate deletion and scaffold
- Automated generation of diagram for your templates

Can use tempaltes on the web to help/inspire

## Basically works like Terraform
- Tempaltes must be uplaoded in S3 and referenced in CloudFormation

## Deploying CloudFormation
- Manual way
- editing tempaltes in Infrastructure Composer or code editor
- Autoamted way
- Editing tempaltes in a YAML file & CLI or using a CD tool

## Building Blocks
Template
- `AWSTemplateFormatVersion`
- `Description`
- `Resources` (MANDATORY) `EXAM`
- `Parameters` (dynamic inputs)
- `Mappings` (static varaibles)
- `Outputs` references to what has been created
- `Conditionals` - list of conditions to perform resoure creation

Tempalte Helpers
- References
- Functions

## HandsOn
To update an existing stack you must use a different template
- Delete works how you would think
- best practice is to not delete anything manually