# {{ page.title }}

source pages/_include/{{page.md_filename}}.md  file

###  Authentication

The Caredove APIs currently require the following security and authentication be implemented:

- All senders must have a Caredove account, and have permissions to refer to the target service
- The Caredove API uses **basic authentication** *(OAuth comin soon!)
- Authenticated with **user email** + API authentication \**token* (contact Caredove to obtain a token)
- Calls to POST /ReferralRequest returns a time limited URL, which will sign the user in to Caredove, and launch the related business logic (e.g., open account page, launch seach page, open a referral form, display a submitted referral, etc...)
- *(comin soon!) Submit referrals without a Caredove Account*

**NOTE:** The document currently publishes the subdomain as "api.", please use "www." for deployment.