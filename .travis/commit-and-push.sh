#!/usr/bin/env bash
set -eu pipefail
IFS=$'\n\t'
TODAY=$(date)
git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"
git config --global push.default current
git stash
git checkout gh-pages
git stash pop
find . -type d ! -regex 'dist|.travis' -delete
mv dist/* .
rm -r .travis/
git add .
git commit -m "auto-update with travis ${TODAY}"
git push https://${TRAVIS_DEPLOY_TOKEN}@@github.com/fabianmoronzirfas/poc-build-process.git