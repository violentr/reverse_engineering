Compile assembler code to object file
$ nasm -f elf -o shellcode.o shellcode.asm

Link object files and output executable
$ ld -o shellcode shellcode.o

We can extract shell code from executable file.
$ objdump -M intel -d shellcode.o

linux opcode extractor, at the end you have string that you may use as shell code.
$ ./extract-opcodes.sh ./schellcode

This should give you the string like 
"\xb8\x0b\x00\x00\x00\xbb\xa0\x90\x04\x08\xb9\x00\x00\x00\x00\xcd\x80\xb8\x01\x00\x00\x00\xbb\x00\x00\x00\x00\xcd\x80”


shell code with no nullbyte chars.
https://nets.ec/Shellcode/Null-free

test your shellcode by using test-shellcode.c

Compile the test-shellcode, must include execstack otherwise will have segmemnt fault
$ gcc test-shellcode.c -z execstack -o test-shellcode

$ ./test-shellcode
if shellcode was properly made, after this command new shell should be spawned

convert ASCII to hex

import binascii
x = b'Hi there'
x = binascii.hexlify(x)
print(x)
