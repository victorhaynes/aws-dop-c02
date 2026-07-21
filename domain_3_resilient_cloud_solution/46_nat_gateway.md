# NAT Gateway
`revisit` NAT Instances, Bastion Hosts, IGW
- AWS managed NAT isntances, higher bandwith, high availability no admin
- pay per hour for usage and bandwidth
- NATGW is created in a specific availability zone, uses an elastic IP
- Can be used by EC2 instance in the same subnet (only from other subnets)
- requres an IGW (Private Subnet -> NATGW -> IGW)
- 5 gbps bandwith with auto caling up to 100 Gbps
- no SGs to manage

The point is this is a solution to give private EC2 instance (private subnet/no IGW) access to the internet without putting it in a public subnet

You point the private subnet's routetable to the NAT gateway

## NAT Gateway with High Availability
- NAT Gateway is resilient within a single AZ
- Must create multiple NAT Gatways in multiple AZs for fault tolerance
- this is because subnets are at the AZ level

### NAT GAteway vs NAT Instance
NAT Gateway
- availability: highly avaialble within AZ (Create in another AZ)
- Bandwidth: up to 100 Gbps
- Maintenance: `managed`
- Cost: per hour & amount of data transfer
- Public ipv4: yes
- private ipv4: yes
- security groups: `no`
- use as a bastion host: `no`

NAT instance
- availability: use a script to manage failover between instances
- Bandwidth: depeends on ec2 type
- Maintenance: `DIY`
- Cost: per hour, instane type and size, network
- Public ipv4: yes
- private ipv4: yes
- security groups: `yes`
- use as a bastion host: `yes`