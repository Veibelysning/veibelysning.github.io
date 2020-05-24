#!/usr/bin/env bash
set -e

export JEKYLL_VERSION=3.8

docker pull jekyll/jekyll:$JEKYLL_VERSION

docker-compose run jekyll bundle update