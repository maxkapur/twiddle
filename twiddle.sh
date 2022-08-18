#!/bin/sh

if [ $# != 2 ]; then
    echo "Usage: twiddle FILE1 FILE2\nSwap the contents of FILE1 and FILE2."
    exit 1
fi

if [ ! -f $1 ]; then
    echo "Error: File $1 doesn't exist."
    exit 1
fi

if [ ! -f $2 ]; then
    echo "Error: File $2 doesn't exist."
    exit 1
fi

swap=$(mktemp)
mv $1 $swap
mv $2 $1
mv $swap $2
