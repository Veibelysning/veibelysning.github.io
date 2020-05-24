#!/usr/bin/env bash
set -e

export JEKYLL_VERSION=3.8
docker-compose run jekyll /bin/bash -c "bundle check || bundle install && rake build"