# CodeDeploy In-place deployments
- use EC2 tags or ASG to identify instances you want to deploy
- If using an ASG the new app code will get picked up automatically
- If using a LB then traffic is stopped to the old instance(s)

## CodeDeploy In-place Deployment Hooks
`hooks` - one or more scripts to be run by CodeDeploy on each EC2 isntance

0. Start
---
 
if using a Load Balancer

1. [`BeforeBlockTraffic`] - can run scripts here
2. BlockTraffic
3. [`AffterBlockTraffic`] - can run scripts here ->
 
---
4. [`ApplicationStop`] (scriptable)] ->
5. DownloadBundle
6. [`BeforeInstall` (scriptable)]
7. Install
8. [`AfterInstall` (scriptable)]
9. [`ApplicationStart` (scriptable)]
10. [`ValidateServices` (scriptable)]
---
If using a Load Balancer

11. [`BeforeAllowTraffic`] - can run scripts here
12. AllowTraffic
13. [`AfterAllowTraffic`] - can run scripts here
---
15. End

## CodeDeploy EC2 Deployment Hooks
Basic Example
```yml
version: 0.0
os: linux

hooks:
  BeforeInstall:
    - location: scripts/install_dependencies.sh
      timeout: 300
      runas: root
  ApplicationStart:
    - location: scripts/start_server.sh
      timeout: 300
      runas: root
  ApplicationStop:
    - location: scripts/stop_server.sh
      timeout: 180
      runas: root
```
- `BeforeInstall` used for preinstall tasks such as decryption files or backups
- `AfterInstall` used for tasks such as configuring your app or chaning file permissions
- `ApplicationStart` used to start services topepd during ApplicationStop
`ValidateServices` - used to verify deployment completetion OK
- `BeforeAllowTraffic` - run tasks on Ec2 instance before registering to the load balancer (EX. perform health checks)

## CodeDeploy - Blue/Green Deployments
2 modes - both require a load balcner
- `Manual` blue instances (old) by tags, green isntances (old) by tags. But these instances must be provisioned ahead of time
- `Automatic Deployment` based on an Load Balancer and Auto Scaling Group 

## Blue-green Isntance Termination
- rules for termianting blue isntance on successful deployment
- termiante based ona a wait time, ebtween 1 hour and 2 days
- or keep after deployment

## Code-Deploy Blue-Green Deployment Hooks
The same as in-place but in a different order

0. Start
---
v2 (Green instances only)
1. [`ApplicationStop`] (scriptable)] ->
2. DownloadBundle
3. [`BeforeInstall` (scriptable)]
4. Install
5. [`AfterInstall` (scriptable)]
6. [`ApplicationStart` (scriptable)]
7. [`ValidateServices` (scriptable)]
8. [`BeforeAllowTraffic`] - can run scripts here
9. AllowTraffic
10. [`AfterAllowTraffic`] - can run scripts here
---
v1 (Blue) Instancs only

11. [`BeforeBlockTraffic`] - can run scripts here
12. BlockTraffic
13. [`AffterBlockTraffic`] - can run scripts here ->
14. End

## Deploymeny Configuration
- Can control speed
`AllAtOnce`
`HalfAtATime`
`OneAtATime`
`Custom`

## Triggers
- CodeDeploy publishes deployment events to SNS