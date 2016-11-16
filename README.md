# Automation for the People

## Setup

You will need a personal GitHub access token. Generate one here: https://github.com/settings/tokens (scopes needed: admin:repo_hook, repo)

```
git clone git@github.com:michaelwittig/automation-for-the-people.git
cd automation-for-the-people/
cd infrastructure/
./init.sh
```

## How it works

This will setup a CodePipeline to:

* connect to the GitHub repository https://github.com/michaelwittig/automation-for-the-people
* update itself
* create/update a ElasticBeanstalk application
* create/update a staging ElasticBeanstalk environment
* deploy a new application version to the staging environment
* run infrastructure tests against the staging environment
* create/update a production ElasticBeanstalk environment
* deploy a new application version to the production environment

## Cleanup

To delete all AWS resources, remove the CloudFormation stacks in the following order:

1. aftp-prod & aftp-stage
2. aftp-application
3. aftp-pipeline
