#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace
echo "pre-variables"
CURRENTDIR="$(pwd)"
GITHUBUSER="$(cat ~/git_user)"
echo "variables set"
# Get user input
read -p "New repo name (enter for $(pwd):" REPONAME
read -p "Git Username (enter for ${GITHUBUSER}):" USER
read -p "Repo Description:" DESCRIPTION

echo "Here we go..."

# Curl some json to the github API oh damn we so fancy
curl -u "${USER:-${GITHUBUSER}}" https://api.github.com/user/repos -d \
    "{\"name\": \"${REPONAME:-${CURRENTDIR}}\", \"description\": \"${DESCRIPTION}\", \"private\": false, \"has_issues\": true, \"has_downloads\": true, \"has_wiki\": false}"

# Set the freshly created repo to the origin and push
# You'll need to have added your public key to your github account
git remote set-url origin git@github.com:"${USER:-${GITHUBUSER}}"/"${REPONAME:-${CURRENTDIR}}".git
git push --set-upstream origin master

exit 0
