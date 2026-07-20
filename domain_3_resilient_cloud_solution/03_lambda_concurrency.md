# AWS Lambda Concurrency
- limit up to 1000 concurrent execution `EXAM`
- can set ar eserved concurrency at the function level (limit)

- If you need more than 1000 concurrent then you can open a support ticket

## Lambda Concurrency Issue
Differnt invokers, an ALB, an API Gatewy, SDK/CLI

it is possble for one hammered entrypoint to throttle the other entrypoints

applies to all the functions in your account

## Conurrency and Asynchronous Invocations
- S3 bucket -> new file event
many files at the same time. many function invocation

- If the function doesn't havee nough concurrency available to process events, additional requests are throttled
- For throttling errors 429 and system errors 400s lambda returns the event to the queue and attemtp to run the function again for up to 6 hours
- The try interval increase expoentially from 1 second after the 1st attempt

## Cold Start & Provisioned concurrency
Cold Start
- new isntance, code is laoded and coe outside the handle run (init)
- if the init is large (code, dpeendencies, SDK) this process can take some time
- First request served by new isntances hsa higher latency than the rest

Provisioned Concurrency
- Concurrency is allocated before the function is invoked (in advance)
- So the cold start enver happens and all invocations have low latency
- Application Auto Scaling can manage concuyrrency

since 2019 cold starts are much faster