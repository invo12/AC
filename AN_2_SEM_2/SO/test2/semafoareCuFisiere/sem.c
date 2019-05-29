#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>

void P(int semafor) {
	int descriptor;	
	char path[80];
	sprintf(path,"/tmp/%d.sem", semafor);
	while((descriptor = open(path, O_CREAT | O_EXCL | O_WRONLY, 0644)) == -1 &&
			errno == EEXIST) {
		sleep(1);
	}
	if(descriptor == -1) {
		fprintf(stderr, "Error creating file.\n");
		exit(EXIT_FAILURE);
	}
	close(descriptor);
}

void V(int semafor) {
	char path[80];
	sprintf(path,"/tmp/%d.sem", semafor);
	if(unlink(path) == -1) {
		fprintf(stderr, "Error removing file.\n");
		exit(EXIT_FAILURE);
	}
}
