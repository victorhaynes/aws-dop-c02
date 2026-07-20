`EXAM`
### CF Rollbacks
If Stack Creation Faiils
 

- everything rolls back gets deleted by `default`, can look at the logs but the resources get deleted
- can optionally disable this

If Stack Update Fails

- stack automatically rolls back to the previous known working state, ability to see in the log what happened and error message

Rollback failure?
- Fix resources manually then issue `ContinueUpdateRollback` API from Console or from the CLI

# Hands On
For simplicity, when something is broken in a stack, delete it then fix the template rather than fix anything manually
- on update we can either roll abck everything on error
or preverse successfully provisioned resources on error