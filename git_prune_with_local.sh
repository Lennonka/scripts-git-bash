#!/bin/bash

REMOTE=origin

if [ -n "$1" ] && git remote | grep -q $1 ; then
	REMOTE=$1
fi
echo "Pruning $REMOTE and removing corresponding local branches."

PRUNED=`git fetch $REMOTE --prune 2>&1 | while read L; do echo "$L%%%"; done`

echo "Remote:"
echo $PRUNED | sed 's/%%%/\n/g'
echo "Local:"
echo $PRUNED | sed 's/%%%/\n/g' | \
	grep "\[deleted\]" | \
	sed "s/.*$REMOTE\///g" | \
	while read BRANCH; do
		BRANCH_EXISTS=`git branch -l $BRANCH`
		if [ -n "$BRANCH_EXISTS" ] ; then
			git branch -D $BRANCH
		fi
	done
echo
echo "Done."

