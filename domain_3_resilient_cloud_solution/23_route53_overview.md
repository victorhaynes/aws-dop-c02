# Amazon Route 53
- scalable, highly availalbe, fully managed, authoritativE DNS
    - authoritative = you the customer can update the DNS records
    - route 53 is also a domain registrar
    - ability to cehck the health of your resources
    - the only AWS service which provides 100% availability SLA

## Route53 Records
- How you want to route traffic for a domain
- Each record contains:
    - domain/subdomain name
    - record type i.e. A or AAAA
    - Values
    - Routing Policy
    - TTL

- `A` - maps a hostname to Ipv4 (i.e. example.com ->1.2.3.4)

- `AAAA` - maps a hostname to IPv6 address

- `CNAME` - maps a hostnme to another hostname, the target domain must be an A or AAAA record (CANNOT create a CNAME record for the top node of a DNS namespace [zone apex])
    - I.e. you can't make a CNAME record for example.com but you can create or www.example.com `EXAM`

- `NS` - Name Servers for the Hosted Zones 
    - controls how traffic is routed to a domin 


## Hosted Zones
- a container for records that define how to route traffic to a domain and its subdomains

- Public Hosted Zones - contains records that specify how to route traffic on the inernet (public domain names) i.e. app1.mypublicdomain.com

- Prviate Hosted Zones - contain records that specify how you route traffic within one or more VPCs (private domian names) i.e. app1.company.internal

