# Amazon API Gateway

## Example building a Serverless API
- Allows us to create public REST APIs
- API Gateway could proxy a reqeust to Lambda
- auth, stages, usage plans, http endpoint

Easy way to get serverless infra
- Supports for websocket protcol (real time streaming)
- Handle API versioning
- Multiple envronments/stages
- Handle security (authentication and auth)
- API keys,handle request throttling
- Swagger / Open API import to quickly define APIs
- Transform adn valdiate requests and responses
- Generate SDK and API specifications
- Cache API responses

## Integrations High Level
Lamda Function
- Invoke lambda function
- Easy eway to expoe REST API backed by AWS Lambda

HTTP
- expose any HTTP endpoints inthe backend
- ex internal HTTP API on premise, application load balancer,
- why? to add rate limiting, caching

Any AWS Service
- Why: auth, rate control,client access to AWS serves
- without access to AWS credentialks

### API Gateway - AWS Services Integraiton
Kinesis Data Streams example

i.e. client -> API GW -> KDS -> KDf -> S3

### 3 Endpoint Types `EXAM`
Edge Optimized (default)
- global clients
- requests re routed through the CF edge location low latency
- API GW instace itself sitll lives in only one region

Regional
- for lients within the same region
- Could manually combine with CF (more conrol over the caching strats adn distr)

Private
- only acessd from your VPC as an interface VPC endpoint (ENI)
- resource policy control/access

## API Gateway Security
User Authentication through
- IAM Roles (useful for internal apps)
- Cognito (identity for external uers. - example mobile users)
- Custom Authorizer (your own logic through lambda)

Custom Domina Name HTTPS
- integratio nwith ACM
- if using edge optimzied cert must be in us-east-1
if doing regioinal then cert must be in region for API gateway
- need CNAME or A-lias record in route 53