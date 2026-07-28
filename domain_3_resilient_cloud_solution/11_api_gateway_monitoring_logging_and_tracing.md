# API Gateway Monitoring, Logging, and Tracing
CloudWatch Logs
- log contains information about request/response body
- enable CloudWatch logging at the Stage level (with Log Level - Error, Debug, INFO)
- Can override settings on a per API basis
- note a lot of sensitive info can end up in the CW logs

X-Ray
- enable tracing to get info about requests in API gateway
- X-ray API gateway + AWS lambda gives you the full picture

## CloudWatch Metrics `EXAM` relevant
- `CacheHitCount` & `CacheMissCount`
- gives feedback on the efficiency of the cache
- `Count` number of total API requests in a given period
- `IntegrationLatency` (how long it takes for backend to reply back to API Gateway)
- `Latency`  time between when API Gateway receives a request from a client and when it returns a response to the client. The latency incldues the integration latency and other API Gateway Overhead

Maximum amount of time is `29` seconds

- `4XXError` client-side errors
- `5XXError` - server side errors

## Throttling
Account Limit
- Requests at 10,000 rps across all API
Soft limit that can be increased upon request
- Incase of throttling -> 429 too many requests
- can set stage limits & method limits
- Can define a Usage Plan to throttle per customer

## Errors
- 4xx means client errors
- 5xx server errors
    - 502  - usually an incompatiable output returned from a lambda proxy integration or ocassional due to heavy loads
    - 503 service unavailable
    - 504 integration failure, i.e. timed out after 29 seconds