#include"hdr.h"
#include<signal.h>
#include<sys/wait.h>

void f(int sig);

int main()
{
	if(signal(SIGUSR2,f) == SIG_ERR)
	{
		printf("eroare la SIGINT");
		exit(1);
	}
	while(1)
	{
		pause();
	}
	return 0;
}

void f(int sig)
{
	int pid1,pid2,pid3,status1,status2,status3;
	pid1=fork();
	if(pid1==0)
	{
		execl("/bin/ps","/bin/ps","wauxf",NULL);
	}
	waitpid(pid1,&status1,0);
	pid2=fork();
	if(pid2 == 0)
	{
		execl("/bin/pwd","/bin/pwd",NULL);
	}
	waitpid(pid2,&status2,0);
	pid3=fork();
	if(pid3 == 0)
	{
		printf("pid parinte: %d\npid fiu1: %d\npid fiu2: %d\npid fiu3: %d",getppid(),pid1,pid2,getpid());
		exit(0);
	}
	else
	{
		waitpid(pid3,&status3,0);
	}
}
