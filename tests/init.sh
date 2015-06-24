#!/usr/bin/env bash

export DOCKER_CLIENT_TIMEOUT=120

# cleanup
docker-compose kill

###docker-compose rm -f

# prepare application
# NOTE: DO NOT run this in the appcli container (with host-volumes, you may overwrite your current project!)
docker-compose run --rm appsrc \
    sh -c '
        composer -vv require bedezign/yii2-audit:dev-master
    '

# Run in CLI container, with database link (ENV variables)
docker-compose run --rm appclit \
    sh -c '
        ./yii app/create-mysql-db && ./yii migrate --interactive=0
    '

# start test stack
docker-compose up -d