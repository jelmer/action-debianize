#!/bin/bash

set -euo pipefail

set -x

IDENTITY="${1}"

# Default lintian-brush arguments
debianize_args=(
    "--verbose"
    "--diff"
)

# Create .config directory, required by breezy
mkdir "${HOME}/.config/"

# Set user information
brz whoami "${IDENTITY}"

debianize "${debianize_args[@]}"
