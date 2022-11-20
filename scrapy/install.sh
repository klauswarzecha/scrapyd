#!/bin/bash
# based on https://pythonspeed.com/articles/system-packages-docker/

set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

# Update the package listing
apt-get update

if [ "$STAGE" == "builder" ]
then
    # Install toolchain without unnecessary recommended packages
    apt-get -y install --no-install-recommends apt-utils build-essential
fi

# Delete cached files
apt-get clean
rm -rf /var/lib/apt/lists/*