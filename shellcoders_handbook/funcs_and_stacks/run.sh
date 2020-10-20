#!/usr/bin/env bash

file=$1
# -gddb; compile gdb output used for debugging
# -mpreferred-stack-boundary ; will setup our stack into dword size increments.
# Otherwise gcc will optimize the stack and make things more difficult then they need to be at this point.
cc -mpreferred-stack-boundary=2 -ggdb "$file".c -o "$file"

#gcc -fno-stack-protector -z execstack "$file".c -o "$file"
