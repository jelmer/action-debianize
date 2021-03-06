# action-debianize

GitHub action that automatically generates and builds Debian packages
using debianize and sbuild.

## Inputs

### `identity`

Identity to use for commits.

Defaults to ``debianize <noreply@github.com>``.

### `directory`

Subpath to run debianize in.

Useful if the source that needs to be packaged is in a subdirectory.

Defaults to ``.``

### `recursive`

Recursively package new dependencies or update existing dependencies.

Defaults to ``true``

### `version-kind`

Kind of version to package. One of:

 * ``auto``: Automatically determine appropriate version kind (default)
 * ``release``: Package the latest release
 * ``snapshot``: Package a VCS snapshot
