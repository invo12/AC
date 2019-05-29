#include "sem.h"
#include <unistd.h>
#include <fcntl.h>
#include <sys/wait.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
int main() {
	unlink("f.txt");
	int child_pid = fork(),i;
	if(child_pid != 0) {
		int second_child_pid = fork();
		if(second_child_pid != 0) {
			P(69);
			char buf[50];
			sprintf(buf,"%d ",getpid());
			int fd = open("f.txt",O_WRONLY|O_CREAT|O_APPEND,0644);
			if(fd == -1) {
				fprintf(stderr, "Couldn't open file.\n");
				exit(EXIT_FAILURE);
			}
			for(i = 0;i < 3;++i)
				write(fd,buf,strlen(buf));
			close(fd);
			V(69);
		} else {
			P(69);
			char buf[50];
			sprintf(buf,"%d ",getpid());
			int fd = open("f.txt",O_WRONLY|O_CREAT|O_APPEND,0644);
			if(fd == -1) {
				fprintf(stderr, "Couldn't open file.\n");
				exit(EXIT_FAILURE);
			}
			for(i = 0;i < 3;++i)
				write(fd,buf,strlen(buf));
			close(fd);
			V(69);
		}
	} else {
		P(69);
		char buf[50];
			sprintf(buf,"%d ",getpid());
			int fd = open("f.txt",O_WRONLY|O_CREAT|O_APPEND,0644);
			if(fd == -1) {
				fprintf(stderr, "Couldn't open file.\n");
				exit(EXIT_FAILURE);
			}
			for(i = 0;i < 3;++i)
				write(fd,buf,strlen(buf));
		close(fd);
		V(69);
	}
}

