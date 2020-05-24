#!/usr/bin/env bash
set -e

export JEKYLL_VERSION=3.8
docker-compose run --service-ports jekyll $1