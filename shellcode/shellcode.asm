section .data
  shell db '/bin/sh'

section .text
  global _start

_start:
  mov eax, 11
  mov ebx, shell
  
  mov ecx, 0
  int 0x80

  mov eax, 1
  mov ebx, 0
  int 0x80
