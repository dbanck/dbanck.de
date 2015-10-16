#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

cd dist

git init
git config user.name "Daniel Banck"
git config user.email "daniel@dbanck.de"

git remote add upstream "https://$GH_TOKEN@github.com/dbanck/dbanck.de.git"
git fetch upstream
git reset upstream/gh-pages

touch .

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages
