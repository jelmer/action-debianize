#!/bin/bash

set -euo pipefail

set -x

IDENTITY="${1}"
DEBIANIZE_DIRECTORY="${2}"

# Default lintian-brush arguments
debianize_args=(
    "--verbose"
    "--iterate-fix"
    "--schroot unstable-amd64-sbuild"
)

# Parse options
if [ -n "${DEBIANIZE_DIRECTORY}" ]; then
    debianize_args+=("--directory=${DEBIANIZE_DIRECTORY}")
fi
if [ "${DEBIANIZE_RECURSIVE}" == "true" ]; then
    debianize_args+=("--recursive")
fi

# Create .config directory, required by breezy
mkdir "${HOME}/.config/"

# Set user information
brz whoami "${IDENTITY}"

debianize "${debianize_args[@]}"
