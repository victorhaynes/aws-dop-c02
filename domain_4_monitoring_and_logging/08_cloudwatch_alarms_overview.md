# CloudWatch Alarms
- Alarms are used to trigger notifications for any metrics
- Various options (samplying, %, max, min etc)
- Alarm States:
    - OK
    - INSUFFICIENT_DATA
    - ALARM
- PERIOD
    - LENGTH OF TIME IN SECONDS  TO EVALAUTE
    - 10, 30, MULTIPLE OF 60S etc

## CW Alarm Targets
- Stop, Terminate, Reboot or Recover an EC2 Instance
- Trigger Auto Scaling Action
- Send notif to SNS (from which you can then do pretty much anything like lambda)

## CW Composite Alarms
- CW alarms are for a single metric `EXAM`
- use AND or OR to create composite alarms
    - i.e. if CPU is high AND network is high then alert me, not just one
- helpful to reduce alar noise by creating more complex business/notif logic

## EC2 Instance Recovery
Status Check
    - instance status = check the EC2 VM
    - system status = check te underlying hardware
    - attacheD EBS status = check attached EBS volumes
Recovery
- On recovery: Same Private, public, elastic ip, metadata, placement group

## CW Alarm: good to know
- Alarms can be created based on CW logs metrics filters
- to test alarms notif, set the alarm state to alarm using CLI

FYI the API call to test an alarm without forcing the scenario
```sh
aws cloudwatch set-alarm-state --alarm-name "myalarm" --state-value ALARM --state-reason "resting purposes"
```