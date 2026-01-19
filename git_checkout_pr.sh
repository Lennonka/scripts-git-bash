#!/bin/bash

if [ -z "$1" -o -z "$2" ]; then
	echo "Fetch a branch from a PR/MR and checkout the branch."
	echo "Usage:"
	echo "    git-checkout-pr <PR/MR ID> <BRANCHNAME>"
	exit 1
else
	ID=$1
	BRANCHNAME=`echo $2 | sed 's/^.*://'`
fi

# Get the URL of the 'origin' remote
REMOTE_URL=$(git remote get-url origin 2>/dev/null)

if [ -z "$REMOTE_URL" ]; then
    echo "Error: No remote 'origin' found."
    exit 1
fi

# Check the URL for the provider name
case "$REMOTE_URL" in
    *github*)
        SERVER=GitHub
	# Modify the GitHub remote name to your setup
	# This is not the standard name (origin)!
	REMOTE=upstream
	PREFIX=pull
	;;
    *gitlab*)
	SERVER=GitLab
	REMOTE=origin
	PREFIX=merge-requests
	;;
    *)
        echo "Error: Remote provider is unknown or not GitHub/GitLab."
	exit 2
        ;;
esac

echo "Fetching from remote: $REMOTE at $SERVER"
git fetch $REMOTE $PREFIX/$ID/head:$BRANCHNAME

git checkout $BRANCHNAME

echo
echo "Info: Done."
