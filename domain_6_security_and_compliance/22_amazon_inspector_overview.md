# Amazon Inspector
- run autoamted security assessments
- for `EC2 instances`
    - leveraging the AWS system manager (SSM) agent
    - analyze agaisnt unintended network accessibility
    - Analyyze the running OS against known vulnerabilities
- `For container images pushed to ECR`
    - assessment of container images as the yare pushged
- `Lambda function`
    - software vulnerabilities in code and package depndencies
    - during deployment

`EXAM: Think compute inspector`

Output is sent to Sercurity Hub and Event Bridge

Runs when needed 
- package vulnerabilities (databse of CVE) for EC2, ECR, and Lambda
- Network reachability (EC2)

A risk score is assocaited with all vulnerabilities for prioritization