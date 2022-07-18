============================
Git Utility Scripts for Bash
============================

- **install.sh** - creates symlinks to all ``git_*`` scripts in the ``~/bin`` folder; the bin folder must already exist
- **git_config_aliases.sh** - adds alias abbreviations for frequent git commands to global git configuration
- **git_checkout_pr.sh** [*]_ - pulls the specified branch from the specified pull request - tested with GitHub only
- **git_prune_with_local.sh** - prunes the local branches that were deleted in the remote repo

.. [*] The remote in this script has a non-standard name for my own purposes and you may need to adapt it for your repo setup.
