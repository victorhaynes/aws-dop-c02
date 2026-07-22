# AWS Config Configuration Recorder and Aggregator

## AWS Config Configuration Recorder
- Store stores configurations of your AWS resoruce as configuration Items
- Configuration Item - a point-in-time view of the various attrs of an AWS resouce. Created whenver AWS Config detects a change to the resouce e.g., attrs, relationships, config, events...
- Custom Configuration Recorder to recod only the resoure types that you specify
- Must be created before AWS Config can track your resources (created automatically wen you enable AWS Config using AWS CLI or AWS Console)

Can attach a SCP on the root of an Org to prevent member accounts from disabling this

## AWS Config - Aggregators
Account A - Source

Account B - Source

Account C - Aggregator

If you use Orgs no auth setup is needed,if you don't then you need to set it up
- the rule are created in each inividual source AWS account
- Can deploy rules to multiple target accounts using CloudFormation StackSets