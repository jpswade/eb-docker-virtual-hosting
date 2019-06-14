#!/usr/bin/env bash
DEPLOY_PATH=suzuki4u
VCS_REPO=git@bitbucket.org:jpswade/suzuki4u.git
RELEASE_TIMESTAMP=release-$(date +"%s")
set -e
cd php-app
git clone ${VCS_REPO} ${DEPLOY_PATH}-${RELEASE_TIMESTAMP}
[[ -d public ]] && rm -fr public
ln -s ${DEPLOY_PATH}-${RELEASE_TIMESTAMP} public
