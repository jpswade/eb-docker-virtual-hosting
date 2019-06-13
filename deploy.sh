#!/usr/bin/env bash
DEPLOY_PATH=suzuki4u
VCS_REPO=git@bitbucket.org:jpswade/suzuki4u.git
RELEASE_TIMESTAMP=release-$(date +"%s")
set -e
sudo git clone ${VCS_REPO} ${DEPLOY_PATH}-${RELEASE_TIMESTAMP}
sudo rm -fr php-app
sudo ln -s ${DEPLOY_PATH}-${RELEASE_TIMESTAMP} php-app
