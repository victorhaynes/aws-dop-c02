# Amazon EventBridge
FKA CloudWatch Events
- Schedule: cron jobs (scheduled scripts)
- Event Patern: Event rules to react to a service doing something

EventBridge uses a `default event bus`

There is a `partner event bus` SaaS partners like Zendesk or DATADOG

Or you can make a `custom event bus`
- Cross account event busses can be set up
- you can archive events (all/filter) sent to an event bus (indefinitely or set period)
- can replay archived events

## EventBridge Scham Registry
- EB infer the schema
- The Schema Registry allows you to generate code for your application that will know in advance how data is structured in the event bus
- Schema can be versioned

## Resource based policies
- manage perms for a specific event bus
- example: allow/deny events from another AWS acct or region
- use case: `aggregate` all events from your AWS Org in a single AWS acct or region

# Hands On
This demo is great

The content filtering Hands On secton is also great. 

Prefix-matching was the example and you essentially just add the JSON event fields you want to match on to the event pattern (matcher). An then you insert the filter and insert your string values

### Input Transformation Hands On `EXAM`
Example: EC2 Instance state-change notification

ex.

`1)` define input varaibles like this:
```json
{
    "timestmap": $.time,
    "instance": $.detail.instance-id
    ...
}
```
You basically query the original JSON structured event using JSONPath

`2)`

Then you can use `<variable_name>` syntax to define the actual input to the target:
ex.
```json
{
    "timestamp": <timestamp>,
    "message": <instance> is in nstate <state> at <timestamp> with arn <resource>
}
```