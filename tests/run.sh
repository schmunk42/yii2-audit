#!/usr/bin/env bash

docker-compose run --rm appcli \
    sh -c ' \
        codecept run -vv -c vendor/bedezign/yii2-audit unit
    '