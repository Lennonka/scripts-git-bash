#!/bin/bash

DIR=~/bin

if [ ! -d "$DIR" ]; then
    echo "E: The folder $DIR does not exist or it isn't a directory"
    exit 1
fi

for F in git_*; do
    LABEL=`echo $F | sed 's/.sh$//' | sed 's/_/-/g'`
    echo "I: Linking $F as $DIR/$LABEL"
    ln -s $PWD/$F $DIR/$LABEL
done

echo "I: Done."
