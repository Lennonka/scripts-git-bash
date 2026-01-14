#!/bin/bash

if [ -z "$1" -o -z "$2" ]; then
	echo "Script to fetch a branch from a pull request and checkout the branch."
	echo "Usage:"
	echo "    git-checkout-pr <PR ID> <BRANCHNAME>"
	exit 1
else
	ID=$1
	BRANCHNAME=`echo $2 | sed 's/^.*://'`
fi

# Modify the remote repo name to your repo setup - this is not the standard name!
REMOTE=upstream

echo "Fetching from remote: $REMOTE"

git fetch $REMOTE pull/$ID/head:$BRANCHNAME
git checkout $BRANCHNAME

echo
echo "I: Done."
