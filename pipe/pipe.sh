#!/usr/bin/env bash
#
# This pipe is an example to show how easy is to create pipes for Bitbucket Pipelines.
#

source "$(dirname "$0")/common.sh"

info "Executing the pipe..."

# Required parameters
RULES=${RULES:?'RULES variable missing.'}


# Default parameters
DEBUG=${DEBUG:="false"}
TYPE=${TYPE:='DIRECTORY'}
run reviewdog -diff="git diff FETCH_HEAD" -tee -reporter=bitbucket-code-report -fail-level error

if [[ "${status}" == "0" ]]; then  
  success "Success!"
else
  fail "Error!"
fi
