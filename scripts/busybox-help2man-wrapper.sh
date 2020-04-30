#!/bin/sh

# Requires the help2man package to be installed from pkgsrc
exec help2man -s 1 -S "Fidelix $OS_VERSION" -N --no-discard-stderr \
	--version-string=1.31.1 $@
