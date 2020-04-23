#!/bin/sh

if [ ! -z "$SERIAL_CONSOLE" ]; then
	SERIAL_PORT=$(echo $SERIAL | rev | cut -d S -f 1 | rev)
	GRUB_COMMANDS="$GRUB_COMMANDS
serial --unit=$SERIAL_PORT --speed=9600; terminal_input --append serial; terminal_output --append serial;"
	KERNEL_ARGS="$KERNEL_ARGS console=tty1 console=$SERIAL_CONSOLE"
fi

cat << EOF
set default="0"
set timeout="5"
$GRUB_COMMANDS

menuentry "$OS_NAME $OS_VERSION" {
        linux $KERNEL_LOCATION/vmlinuz $KERNEL_ARGS
        boot
}

EOF

