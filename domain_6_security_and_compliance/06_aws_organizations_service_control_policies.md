# AWS Organizations Service Control Policies
- Define allowlist or blocklist IAM actions
- Applied at the OU or the Account level
- Does not aply to the Management Account (does not respect SCPs `EXAM`)
- SCP is applied to all the Users and Roles in the account, including Root user
- The SCP does not affect Service-linked roles
    - Service-linked roles enable other AWS ervices to integrate with AWS Organizations can can't be restricted by SCPs
- `SCP must have an explicit Allow` `EXAM` from the root a each OU in the direct path to the target account (does not allow anything by default)
- Use cases:
    - restrict access to certains services (i.e. can't use EMR)
    - enforce PCI compliance by explicitly disabling services


`Remember, SCPs do not apply to the management account`
But if we put a SCP FullAWSAccess + Deny S3 on an example OU (sandbox) then the result is we have everything but s3

Remember need explicit allows