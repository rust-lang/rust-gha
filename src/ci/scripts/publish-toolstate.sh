#!/bin/bash
# Publish the updated toolstate data.

set -euo pipefail
IFS=$'\n\t'

source "$(cd "$(dirname "$0")" && pwd)/../shared.sh"

export MESSAGE_FILE="$(mktemp -t msg.XXXXXX)"
source src/ci/docker/x86_64-gnu-tools/repo.sh

commit_toolstate_change "${MESSAGE_FILE}" "$(ciCheckoutPath)/src/tools/publish_toolstate.py" \
    "$(git rev-parse HEAD)" "$(git log --format=%s -n1 HEAD)" "${MESSAGE_FILE}" \
    "${TOOLSTATE_REPO_ACCESS_TOKEN}"
