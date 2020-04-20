#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Usage: $0 <device node>" >&2
	exit 1
fi

blkid | grep ^$1: | tr ' ' '\n' | grep ^UUID= | cut -d '"' -f 2

