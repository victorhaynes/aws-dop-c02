# Amazon DynamoDB
`EXAM`
- fully managed, highly avaialble, replication across multi AZ
- NoSQL database - not a relational database - with transaction support
- Scales to massive workloads, dsitributed datbase
- Millions of requests per seconds, trillions of rows, 100s of TB of storage
- Fast and conssitenct perfomance single digit millisecond
IAM integration
- Lowcost and auto scaling capabilities
- No maintenance or patching, always available
- Standad & Infrequently Accessed (IA) storage tiers

## DynamoDB - Basics
- DynamoDB is made of Tables
- Each table has a PK
- infinite number of rows
- Each item has attributes (can be added over time, can be null, flexible schema `EXAM`)
- Maximum size of an itemis 400KB
- Data Types
    - Scalar - string, num, binary, boolean, null
    - Document Types - lists, map
    - Sets - string set, number set, binary set

Table Example
- Parition Key -> makes up PK
- Sort Key -> makes up PK
- Attributes

## DynamoDB Read Write Capacity Modes
- Control how you manage your table's capacity (read/writethroughput)

- Provisioned Mode (default)
    - specify the number of reads/writes per second
    you need to plan caapity beforehand
    - Pay for provisioned Read Capacity Units (RCUs) and WCUs
    - Possibility to add auto-scaling mode for RCU & WCU
- On-Demand Mode
    - read/writes scale up/down with your workloads
    - pay for waht oyu use but more expensive
    - no capacity planning
    - great for unpredictable workloads or steep sudden spikes `EXAM` 