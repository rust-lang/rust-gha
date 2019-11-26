#!/bin/bash
# Start the CI build. You shouldn't run this locally: call either src/ci/run.sh
# or src/ci/docker/run.sh instead.

set -euo pipefail
IFS=$'\n\t'

source "$(cd "$(dirname "$0")" && pwd)/../shared.sh"

export CI="true"
export SRC=.

wrapper() {
    if isWindows; then
        msys2-dll-fix $@
    else
        $@
    fi
}

# Remove any preexisting rustup installation since it can interfere
# with the cargotest step and its auto-detection of things like Clippy in
# the environment
rustup self uninstall -y || true
if [ -z "${IMAGE+x}" ]; then
    wrapper src/ci/run.sh
else
    wrapper src/ci/docker/run.sh "${IMAGE}"
fi
