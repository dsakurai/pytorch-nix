#!/usr/bin/env bash
set -e

#
# Run jupyter lab
#

# the directory of this script
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

# Change directory to this script's
cd "$SCRIPT_DIR"

../nix-scripts/nix-develop.sh --command bash -c 'eval $(poetry env activate) && export JUPYTER_CONFIG_DIR="$(pwd)/.jupyter" && jupyter lab --no-browser'
