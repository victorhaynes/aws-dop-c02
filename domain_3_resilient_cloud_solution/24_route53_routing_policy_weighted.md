# Route 53 Routing Policy Weighted
- control the % of the requests taht go to a specific resource i.e. 70%, 20%, 10%
- IRL these do not have to add up to 100% though
- DNS records msut have the same name & type
- Can be associated with health checks
- Use cases: load balancing btween regions, testing new app verions etc
- If all records have weight of 0 then the records will have the same weight