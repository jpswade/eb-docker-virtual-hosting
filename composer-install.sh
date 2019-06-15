#!/usr/bin/env bash
docker run --rm --volume ${PWD}/php-app/public:/app composer install --ignore-platform-reqs --no-scripts