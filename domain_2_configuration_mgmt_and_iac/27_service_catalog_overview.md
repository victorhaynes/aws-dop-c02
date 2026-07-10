# AWS Service Catalog
- self service portal for launching only authorized products, pre-defined by admins
- controlled environment

Relies on CloudFormation

## Admin persona
Define `products` - CF templates
product -> portfolio (collection) -> IAM permissions for controls

## User Persona
Presented a product list
IAM controls what they can see or launch

# TLDR 
users can only do what they are allowed, they choose from admin-created catalogs and this is backed by cloudfront template
- ensures consistency and standardization (Tagging, configuration), governance, compliance, and consistency `EXAM`
- users/teams get a self-service portal
- good for when a user does not need deep knowledge but needs AWS resources
- integrate with self-service portals such as ServiceNow

