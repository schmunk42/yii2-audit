#!/usr/bin/env bash

docker-compose run --rm appcli \
    sh -c ' \
        composer install bedezign/yii2-audit dev-master
        codecept run -c vendor/bedezign/yii2-audit unit
    '