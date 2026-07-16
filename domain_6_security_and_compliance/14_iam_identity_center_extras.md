# IAM Identity Center Extras
- SAML2.0 integration for any external identity provider (Okta, Azure AD, OneLogin)
- Does NOT provide a way to query the IdP to learn about users and groups
- `you essentially need to create the users and groups in the IAM Identity Center that are identical to the users and groups in the External IdP` manual duplication

- Solution: `SCIM` protocol, automatic provisioning/sycnhoinzation of user identiites form an externala IdP  into IAM Identity Center
    - Ssytem for Cross-domain Idnentity Manager
    - Must be supported by the external IdP


## IAM Identity Center - ABAC
- Attr based access controls
- based on tags on your users
- then attrs can be used in permission sets and resource-based policies
- Use case: define permissions once, then modify access by chaning the attrs

## Iam Identity Center MFA
Always on
- self explantory

Context aware MFA
- when the signign context changes (device, browser, location etc)