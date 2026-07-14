# Elastic Load Balancer Extras

### ELB - DualStack Networking
- allows clients to communicaet with the ELB using both IPv4 and IPv6
- Supports both ALB and NLB

Accessible by ipv4, ipv6, and `dualstack` -- which will resolve ipv4 or ipv6 just give them the dualstack url and the correct protocol will be used
- ALB and NLB can have mixed IPV4 and IPV6 targets in seprate target groups (cannot mix inside a group)
- if you only have IPV4 target the ELB will convert IPv6 to IPv4

- Note: AZ must be added/enabled or isntances to receive traffic

### NLB - PrivateLink Integration
Service Consumer VPC

Service Provider VPC

if the IP CIDRs are olverlapping we cannot peer these VPCS.

Th solution is create a NLB in the service provider VPC, and in the service consumer we create a VPC Interface Endpoint

revist `vpc ednpoints/vpc interface endpoint`
