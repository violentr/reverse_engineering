#include <stdio.h>
#include <unistd.h>

int srtcpy() {
    setuid(0);
    system("/bin/////////////////////////////////////sh -p");
    return 0;
}

int runcommand() {
    system("ls");
    return 0;
}


int readUserData() {
    char buffer[1000];
    read(0, buffer, 1500);
    printf("Sorry, this is not correct. \n");
    return 0;
}


int main (int argc, char * argv[]) {
    printf("Provide root password:\n ");
    readUserData();
    return 0;
}
