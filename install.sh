#!/bin/bash
# based on https://pythonspeed.com/articles/system-packages-docker/

set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

# Update the package listing
apt-get update

# Install security updates
apt-get -y upgrade

if [ "$STAGE" == "builder" ]
then
    # Install toolchain without unnecessary recommended packages
    apt-get -y install --no-install-recommends apt-utils build-essential gcc
elif [ "$STAGE" == "worker" ]
then
    apt-get -y install --no-install-recommends curl
fi

# Delete cached files
apt-get clean
rm -rf /var/lib/apt/lists/*