#!/bin/bash -e

echo "enter the name of the artifacts bucket that is created for this application. name must be unique."
read ARTIFACT_BUCKET_NAME

echo "enter a GitHub OAuth token for your user's account. Generate one here: https://github.com/settings/tokens (only needs public_repo access)"
read GITHUB_OAUTH_TOKEN

# TODO add later aws --region eu-west-1 s3 mb "s3://${ARTIFACT_BUCKET_NAME}"
aws --region eu-west-1 cloudformation create-stack --stack-name "aftp-pipeline" --template-body file://pipeline.yaml --parameters "ParameterKey=ArtifactsBucketName,ParameterValue=${ARTIFACT_BUCKET_NAME}" "ParameterKey=GitHubOAuthToken,ParameterValue=${GITHUB_OAUTH_TOKEN}" --capabilities CAPABILITY_IAM
