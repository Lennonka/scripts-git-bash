#!/bin/bash
echo -n "I: Configuring git aliases globally... "
git config --global alias.st "status"
git config --global alias.ll "log --oneline --graph"  # view history of the current branch
git config --global alias.ci "commit"
git config --global alias.co "checkout"
git config --global alias.us "stash pop"  # unstash, i.e. retrieve the last stash
git config --global alias.br "branch"
git config --global alias.dif "diff --name-only"  # list unstaged changed files
git config --global alias.un "reset HEAD --"  # unstage
git config --global alias.ls 'diff --name-status HEAD^' # list changed files
git config --global alias.cp 'cherry-pick'
echo "done"
echo "I: This is your global git configuration now:"
git config --list --global | while read L; do printf "     $L\n"; done
echo "I: Script finished."
