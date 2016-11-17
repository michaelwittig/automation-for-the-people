# Automation for the People

## Setup

1. fork the project on GitHub: https://github.com/michaelwittig/automation-for-the-people
2. create a personal GitHub access token. Generate one here: https://github.com/settings/tokens (scopes needed: admin:repo_hook, repo)
3. clone the project: `git clone git@github.com:YOUR_USERNAME/automation-for-the-people.git`
4. cd into the cloned directory: `cd automation-for-the-people/`
5. cd into the infrastructure directory: `cd infrastructure/`
6. run: `./init.sh`

## How it works

This will setup a CodePipeline to:

* connect to the forked GitHub repository
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
