#include "hdr.h"
#include <sys/wait.h>
#include <sys/msg.h>
#include <sys/sem.h>
#include <sys/ipc.h>
#include <fcntl.h>
struct msgbuf
{
	long mtype;
	char mtext[256];
};

void P(int semid)
{
	struct sembuf pbuf;
	pbuf.sem_num = 0;
	pbuf.sem_op = -1;
	pbuf.sem_flg = 0;
	if(semop(semid,&pbuf,1) == -1)
		err_sys("eroare P");
}
void V(int semid)
{
	struct sembuf pbuf;
	pbuf.sem_num = 0;
	pbuf.sem_op = 1;
	pbuf.sem_flg = 0;
	if(semop(semid,&pbuf,1) == -1)
		err_sys("eroare V");
}

int initSemafor(key_t key)
{
	int semid;
	semid = semget(key,1,0644 | IPC_CREAT);
	if(semid == -1)
		err_sys("eroare creare set semaf");
	semctl(semid,0,SETVAL,1);
	return semid;
}

int initCoada(key_t key)
{
	int msgid;
	msgid = msgget(key,0644 | IPC_CREAT);
	if(msgid == -1)
		err_sys("eroare coada mesaj");
	return msgid;
}

int main(int argc,char* argv[])
{
	int fd,status,i,nrFii,pid,semid,msgid;
	key_t cheieSem = 0x200,cheieMsj = 0x201;
	
	fd = open("out.txt",O_WRONLY|O_CREAT|O_TRUNC,0600);
	if(fd == -1)
		err_sys("eroare deschidere fis out");

	if(argc == 1)
	{
		nrFii = 2;
	}
	else
	{
		nrFii = atoi(argv[1]);
	}

	msgid = initCoada(cheieMsj);
	semid = initSemafor(cheieSem);

	for(i = 0;i < nrFii;++i)
	{
		printf("%d",i);
		fflush(stdout);
		pid = fork();
		if(pid == -1)
			err_sys("eroare la fork");
		if(pid == 0)
		{
			struct msgbuf mesaj;
			char buf[10];
			msgrcv(msgid,&mesaj,sizeof(mesaj),i,0)
			if(strcmp(mesaj.mtext,"poftim") == 0)
			{
				P(semid);
				sprintf(buf,"%d ",getpid());
				write(fd,buf,strlen(buf));
				V(semid);
			}
			exit(0);
		}
		else
		{
			struct msgbuf mesaj;
			char mes[20] ="poftim";
			mesaj.mtype = i;
			strcpy(mesaj.mtext,mes);
			msgsnd(msgid,&mesaj,sizeof(mesaj),0);
			printf("da");
			fflush(stdout);
			wait(&status);
		}
	}
	return 0;
}
