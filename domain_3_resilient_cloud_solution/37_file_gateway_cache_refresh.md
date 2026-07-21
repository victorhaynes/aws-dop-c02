# File Gateway Cache Refresh
- Storage Gateway updates the File Sahre Cache autoamticaly when you write files ot the File Gateway
- if a user writes to FGW then it will sync with S3
- if a user writes to S3 drectly then FGW might not know about it right away
- Invoke the `RefreshCache API` 
    - either on demand
    - or periodically i.e. via lambda

## Autmating Cache Refresh
- FGW auto up to date with the S3 buckets
- Ensures users do not have stale data on file hares
- No need for manual or periodic invocations
- Can still use RefreshCAche API

