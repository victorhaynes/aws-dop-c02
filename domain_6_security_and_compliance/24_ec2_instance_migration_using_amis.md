# EC2 Instance Migration Using AMIs
1. create an AMI for existing instance
2. restore that AMI into the target AZ

# Cross ACCT AMI sharring
- share ami with another AWS accounts
- Sharing does not affect the ownership of the ami
- you can only share AMIs that have unencrypted volumes and volumes that are encrypted with a customer managed key `EXAM` (rewatch)
- if you share an AMI with encrypted volumes, you must also share any customer managed keys used to encrypt them

## Cross-Account AMI Copy
- not sharing but copy
- if you COPY an AMI that has been shared  then you become the owner of the target AMI in your account
- The owner of the source AMI must grant you read permissions for the storage that backs the AMI (EBS snapshot)
- If the shared AMI has encrypted snapshots you need to sharew the keys(s) with you also
- can encrypt the AMI with your own CMK while copying