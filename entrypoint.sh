#!/bin/bash

set -xe

if [ -f /code/.phplint.yml ]; then
  /root/.composer/vendor/bin/phplint -vvv -c /code/.phplint.yml
else
  /root/.composer/vendor/bin/phplint -vvv -c /root/.phplint.yml
fi