# Amazon S3 Object Integrity
- Uses S3 checksum to validate the integrity of uploaded obects
- Using MD5
- You can figure out if the item on your computer and in S3 are identical

- Using MD5 & ETag
    - ETag - represents a specific version of the object, ETag = MD5
    - Get Object Metadata S3 API Call to get this tag

- Other checksums supported, SHA-1, SHA-256, CRC32, CRC32C