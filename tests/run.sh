#!/usr/bin/env bash

docker-compose run --rm appcli \
    sh -c ' \
        codecept build -c vendor/bedezign/yii2-audit
        codecept run -c vendor/bedezign/yii2-audit unit
    '