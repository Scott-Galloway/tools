#!/usr/bin/env bash
# Scott Galloway tools path setup

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace

mkdir -p ~/bin

function mklinks_tools ()
{
    if [[ -f ~/development/tools/"${1}" ]]; then
        :
    else
        ln -s ~/development/tools/"${1}" ~/bin/
    fi
}

mklinks_tools "github/mkrepo.sh"

exit 0
