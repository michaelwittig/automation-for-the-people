#!/bin/bash -e

echo "enter the name of the artifacts bucket that is created for this application. Name must be globally unique (e.g. michael-aftp)"
read ARTIFACT_BUCKET_NAME

echo "enter a personal GitHub access token. Generate one here: https://github.com/settings/tokens (only public_repo access needed)"
read GITHUB_OAUTH_TOKEN

aws --region eu-west-1 s3 mb "s3://${ARTIFACT_BUCKET_NAME}"
aws --region eu-west-1 cloudformation create-stack --stack-name "aftp-pipeline" --template-body file://pipeline.yaml --parameters "ParameterKey=ArtifactsBucketName,ParameterValue=${ARTIFACT_BUCKET_NAME}" "ParameterKey=GitHubOAuthToken,ParameterValue=${GITHUB_OAUTH_TOKEN}" --capabilities CAPABILITY_IAM
