# API Gateway OpenAPI
- common way of defining REST APIs using API definition as code
- Import existing OpenAPI 3.0 spec to API Gateway
- Method
- Method Request
- Integration Request
- Method Response
- `+` AWS Extensions for API gateway and setup every sinle option

- Can export current API as OpenAPI spec
- OpenAPI specs can be written in YAML or JSON


`revit for my own use case, separate from WRGG`

## REST API - Request Validation
- Can configure a desired schema
- Caller can fail immediately witha. 400 error
- i.e. request params,headers, query strings etc.
- or a specific payload body matches a schema
- prevents bad request from hitting the backend
