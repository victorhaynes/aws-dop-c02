# Typical architecture: Web App 3-tier
- ELB
- ASG
- Data Store

Sometimes it is a pain to deploy common infra pattern repeatedly

## Overview
- Elastic Beanstalk is a developer centric view of deploying an application on AWS
- Manged services, automatically handles capacity provisioning, load balancing, scaling, application, health monitoring
- Beanstalk is free but you pay for the underlying resoruces
- backed by cloudformation underneath

## Beanstalk Components
- `Application` collection of Elastic Beanstalk components (environments, versions, configuration)
- `Application Version` iteration of app code
- `Environment` - only 1 Application Version at a time in an Environment

