#!/usr/bin/env bash
input_file=$1
mode=elf

nasm -f$mode $input_file.asm -o $input_file.o
ld -o $input_file $input_file.o
echo -e "[+] File is created: $input_file \n"
echo -e "Shellcode below \n"
./extract_opcodes.sh $input_file
