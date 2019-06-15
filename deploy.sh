#!/usr/bin/env bash
DEPLOY_PATH=suzuki4u
VCS_REPO=git@github.com:jpswade/suzuki4u.git
RELEASE_TIMESTAMP=release-$(date +"%s")
set -e
cd php-app
git clone ${VCS_REPO} ${DEPLOY_PATH}-${RELEASE_TIMESTAMP}
[[ -d public ]] && rm -fr public
ln -s ${DEPLOY_PATH}-${RELEASE_TIMESTAMP} public
aws s3 cp s3://elasticbeanstalk-eu-west-1-226269639461/suzuki4u/.env public/.env