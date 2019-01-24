#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
TODAY=$(date)
git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"
git config --global push.default current
git stash
git checkout gh-pages
git stash pop
find . -type d ! -name 'dist' -delete
mv dist/* .
git add .
git commit -m "auto-update with travis ${TODAY}"
git push https://${TRAVIS_DEPLOY_TOKEN}@@github.com/fabianmoronzirfas/poc-build-process.git