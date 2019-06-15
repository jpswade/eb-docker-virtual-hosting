#!/usr/bin/env bash
docker run --rm --volume 'php-app/public:/app' composer install --ignore-platform-reqs --no-scripts