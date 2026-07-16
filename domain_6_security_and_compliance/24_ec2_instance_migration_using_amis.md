# EC2 Instance Migration Using AMIs
1. create an AMI for existing instance
2. restore that AMI into the target AZ

# Cross ACCt AMi sharring
- share ami with another AWS accounts
- Sharing does not affect the ownership of the ami
- you can only share AMIs that have unencrypted volumes and volumes that are encrypted wit ha customer managed eky
- if you share an AMI with encrypted volumes, you must also sahre any customer managed keys used to encrypt them

## Cross-Account AMI Copy
- not sharing but copy
- if you COPY an AMI that has been sahred  then you become the owner of the target AMI in your account
- The owner of the soruce AMI must grant you read permissions for the storage that backs the AMI (EBS snapshot)
- If the shared AMI has encrypted snapshots you need to sharew the keys(s) with you also
- can encrypt the AMI with your own CMK while copying