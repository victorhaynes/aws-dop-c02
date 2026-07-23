Domain 1

06 change set, CF as target? - TLDR you can use CodePipeline to deploy CloudFormation infra itself. Can you StackSets and confgiure/various settings

07 CodePipeline RunOrder parallelism - TLDR you can run CodePipeline steps in parallel/at the same time using the `RunOrder` value. I.e. 1 CodeCommit feeds 2 CodeBuild tasks in parallel to perform 2 differn tests at once

10 Lambda Alias vs Versions - versions are a code/layer bundle version of a function, aliases are pointers so you can have same UX but new func underneath

11 Code Deploy Hooks for EC2
2.5 flavors
EC2 in place /w or W/O Load Balancer
- only diff is whether or not you need the beforeblocktraffic, after blocktraffic, ad beforeAllowtraffic, and afterAllowtraffic

- blue / green works similar. You MUST use a load balancer but instead of replacing instances you create a second green ASG (manual or automatic ec2 instance provisioning). The hooks are similar but the v2 instances don't have any of the BeforeBlockTraffic/AfterBlockTraffic hooks because they are not under any traffic yet in the first place


14 CodeDeploy Redploys & Rollbacks & Trouble Shooting
- rollbacks can be automatic or based on CW alarms or manual
- can be disabled
- will issue last known good version
- `InvalidSignatureException` == time missmatch between ec2 and CodeDeploy (time provided by AWS)
- debugging
    - make sure CD agent is isntalled, running
    - reachable
    - perms
    - time alignment
    - note if an ASG scales out DURING the deploymnt you can get the v1 app not the v2 app because it is not done yet
        - CD will automatically reconcile this but not instantly when this hapens
    - If allow traffic event/hook fails
        - the ELB might have mis configured health check (this can never pass if your health checks are wrong, which makes sense)


Domain 2
09 iam:PAssrole
- put sts:AssumeRole on a Service (like Lambda or CloudFormation...preferably with a condition to lock down what the service is willing to assume i.e.) so a user can invoke the service with permissions tha are not there own
- the user then needs perms to call the service and then iam:PassRole with a refrence to what execution role they are going to pass

17 - `cfn-signal` &  `Wait Conditions` Up
- cfn-signal gets ran right after cfn-init, will say OK or FAIL
- the WaitCondition can have 1 to N number of things to wait on. Works as you would expect


37 Step Functions & Task state
- think like a step in a step function
- states are a type of action
    - task
    - choice
    - parallel
    - map
    - pass
    - wat
    - succeed
    - fail

Domain 3

API Gateway Stages
- stages are like environments (classic dev, staging, prod)
    - stage variables are like environment variables for API Gateway
    - chan change often without redploying


Kinesis Data Streams
- Need to process events? Use KDS.
- Need to deliver event somewhere? Use Firehose.
- Need both real-time processing and delivery? Use KDS followed by Firehose.

ElastiCache modes
- Cluser Mode Disabled
    - one primary node, up to 5 replicas
    - asycnrhonous replication
    - primary node read/write, others read-only
    - one shard, all nodes ahve all the data
    - guard against data loss if ndoe failjure
    - multi az enabled by default for failover, good for read scaling also
        - can scale horizontally or vertically

Note a shard is made up of multiple nodes (and the shards can be multi AZ). the point is in cluster mode you can have multiple primary nodes, good for scaling writes
- when cluster mode is enabled you can setup auto scaling


ASG launch template
- self explanatory

ALB Listener rules
- processed in order
- foward, redirect, fixed response
- rule Conditions (i.e. path pattern, headers, source-ip, query-strings etc. for complex routing)

appsec.yml
- CodeDeploy
- Deployment files, lifecycle hooks, permisions
buildspec.yml
- CodeBuild
- defines build phases, cmmnds, artifacts, envionment varaibles

Web tier vs worker tier