#!/usr/bin/env /bin/bash
set -e

# Note: this has to internally start the jupyter server 
nix develop --extra-experimental-features nix-command --extra-experimental-features flakes --command bash -c 'eval $(poetry env activate) && jupyter lab --no-browser'
