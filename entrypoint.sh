#!/bin/bash

set -euo pipefail

set -x

IDENTITY="${1}"
DEBIANIZE_DIRECTORY="${2}"
DEBIANIZE_RECURSIVE="${3}"
DEBIANIZE_VERSION_KIND="${4}"

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
if [ -n "${DEBIANIZE_VERSION_KIND}" ]; then
    debianize_args+=("--upstream-version-kind=${DEBIANIZE_VERSION_KIND}")
fi

# Create .config directory, required by breezy
mkdir "${HOME}/.config/"

# Set user information
brz whoami "${IDENTITY}"

debianize "${debianize_args[@]}"
