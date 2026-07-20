# CF Service Roles
- IAM role that allows CF to CRUD resources on your behalf
- If you want users to be able to do this but not directly you can give them CF permissions then CF performs the actions

i.e. they can invoke a stack but not do things manually

require `iam:PassRole` `EXAM`

## When making a stack
If you do not specify a role for the stack it will fallback to your own personal permissions

So you probably want to make a role for your stack