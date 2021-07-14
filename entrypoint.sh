#!/bin/bash

set -xe

if [ -f /code/.phplint.yml ]; then
  /root/.composer/vendor/bin/phplint -vvv -c /code/.phplint.yml -- /code
else
  /root/.composer/vendor/bin/phplint \
    -vvv \
    --no-configuration \
    --warning \
    --exclude=vendor \
    --exclude=node_modules \
    --extensions=php \
    --jobs=10 \
    -- /code
fi