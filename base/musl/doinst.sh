#!/bin/sh

SYS_LD_FILE=$(ls lib | egrep '^ld-musl-.*\.so\.1$' | cut -d . -f 1)
pkgtool install-new-file etc/${SYS_LD_FILE}.path

