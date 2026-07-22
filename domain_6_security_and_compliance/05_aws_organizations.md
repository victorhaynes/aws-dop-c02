# AWS Organizations
Hierarchy
- Root OU
    - Management Account
        - Can have sub OUs
            - OU Dev
            - OU Prod
                - OU HR
                - OU Finance

`EXAM`

`OrganizationAccountAccessRole`:

If we create a member account from the AWS Organization API/Service:
- that member account autoamtically gets `OrganizationAccountAccessRole`
- Performs admin duties
- Used to perform admin tasks (by mgmt account) in the member accounts
- can be assumed by IAM users in the mgmt account if enabled
- If you invite a pre-exiting account then you need to create the role manually

## Multi Account Strats
- per dep
- per cost center
- per environment
- based on regulation
- better resource isolation
- per account service limits
- isolated acct for logging
.

.

- Want to use stagging stnadards

## AWS Orgs - Feature Modes
- `consolidated billing features`
    - consolidated billing across all accounts - singel payment method
    - pricing benefits from aggregated usage (volume discoutn for EC2, S3)
- `all features (default)`
    - includes consolidated billing features, SCP
    - invited accounts must approve enaling all features
    - ability to apply an SCP to prevent member acconts from leaving the org
    - can't switch back to consolidated billing features only


## AWS Orgainzations - Reserved Instance
- Consolidated billing feature on AWS Orgs treats all the accounts in the organization as one account
- so if 1 account has a reserved isntance then all accounts can receive the hourly cost benefits of an RI even if a diff account purchases
- The payer account (mgmt acct) of an org can turn off RI discount, Savings Plan discount sharing for any accounts in that org, including the payer account
- To share an RI or Savings Plan discount with account then sharing msut be turned on for both accounts `EXAM` 

`EXAM`
# AWS Orgs - Moving Accounts
1. Send an invite to teh member account
2. Accep the invite to the new Org from the membeer account

very simple