#!/usr/bin/env bash

export DOCKER_CLIENT_TIMEOUT=120

# cleanup
docker-compose kill
docker-compose rm -f

# start test stack
docker-compose run --rm appcli \
    sh -c '
        composer require edezign/yii2-audit:dev-master phpunit/dbunit:@stable
        ./yii app/create-mysql-db && ./yii migrate --interactive=0
    '
docker-compose up -d