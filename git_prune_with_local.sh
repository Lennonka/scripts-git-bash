#!/bin/bash

if [ -n "$1" ] && git remote | grep -q $1 ; then
	REMOTE=$1
	echo "Pruning $REMOTE and removing corresponding local branches."
else
	echo "You must enter a valid remote:"
	git remote
	exit 1
fi

PRUNED=`git fetch $REMOTE --prune 2>&1 | while read L; do echo "$L%%%"; done`

echo $PRUNED | sed 's/%%%/\n/g'
echo "Local:"
echo $PRUNED | sed 's/%%%/\n/g' | \
	grep "\[deleted\]" | \
	sed "s/.*$REMOTE\///g" | \
	xargs git branch -D
echo
echo "Done."

