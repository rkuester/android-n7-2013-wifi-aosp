#!/bin/sh
USAGE="$0 DIR"
HELP="Store the metadata for the tree under DIR"

DIR=${1:?usage: $USAGE}

find $DIR -mindepth 1 ! -type l \
	-printf 'chown %U:%G "%p" && chmod %#m "%p"\n' \
| sort -k3
