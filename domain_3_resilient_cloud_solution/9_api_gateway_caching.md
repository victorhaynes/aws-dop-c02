# API Gateway Caching
- reduce number of calls mae to the backend
- default is 300s (min 0/none, max 1 hour)
- cached at the stage level
- can override per method
- encrypted
- expensive
- between .5GB to 237GB

## Cache Invalidation
- with a specific header `header: Cache-Control:max-age=0`
or from the UI (with IAM auth)
- highly important to contorl this with IAM & ui config otherwise anyone can send the header and spike your costs