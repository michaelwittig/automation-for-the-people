#!/bin/bash -e

echo "enter your GitHub user name. The user must own the fork!"
read GITHUB_USER_NAME

echo "enter a personal GitHub access token. Generate one here: https://github.com/settings/tokens (scopes needed: admin:repo_hook, repo)"
read GITHUB_OAUTH_TOKEN

aws --region eu-west-1 cloudformation create-stack --stack-name "aftp-pipeline" --template-body file://pipeline.yaml --parameters "ParameterKey=GitHubUserName,ParameterValue=${GITHUB_USER_NAME}" "ParameterKey=GitHubOAuthToken,ParameterValue=${GITHUB_OAUTH_TOKEN}" --capabilities CAPABILITY_IAM
