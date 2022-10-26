# Policy Subscription Remediation Module Change Log
## policy_subscription_remediation v1.1.0 features and bug fixes:

1. Tested compatibility with azure_rm 3.9.0
2. Tested compatibility with Terraform version 1.2.8
3. This module only works with policy defintions and do not support policy set definitions.To create remediation task for policy set definitons , manually to be done from the portal
4. This Bug is fixed in provider version 3.23.0. Please refere doc and use the supported arguments accordingly.