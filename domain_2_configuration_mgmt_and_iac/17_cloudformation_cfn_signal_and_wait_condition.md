# CF cfn-signal & wait conditions
- How you check for user data sfinishing
- use `cfn-signal` script after `cfn-init`
.
.
- Must define a `WaitCondition`
- Block the template until it receives a signal from `cfn-signal`
- Attach a `CreationPolicy` (on for EC2 or an ASG)
- We can define a Cont > 1 (in case you need more than 1 signal)
```yml
CreationPolicy:
    ResourceSignal:
        Timeout: PT5M
        Count: 1
```

Essentially as part of your user data/cfn init you send a signal back to the Wait Condition