`EXAM`

# CF DeletionPolicy Delete
- DeletetionPolicy
- Controls what happens when the CF template is deleted or whe na resoruce is removed from a CF template

- Default = `Delete` when removed or stack is deleted, the resources is deleted

Another example for `S3`:

`DeletetionPolicy: Delete` only works when the bucket is empty
- workaround, manually delete 
- or make a custom resource to handle this

# CF DeletionPolicy Retain
- Speciffy resources on resources to rpeserve in case of CF deletes
- works with all resoruces

# CF DeletionPolicy Snapshot
- creates a snapshot before deleting
- EBS, ElsatiCace, Redshift, Neptune, DocumentDB etc
- Self explanatory

`note to self: maybe integrate this with my own project's DB storage`