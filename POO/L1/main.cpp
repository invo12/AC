#include <iostream>
#include "Header.h"
using namespace std;

void f(int b)
{
	cout << "1";
}

int main()
{
	//C
	/*int* p = (int*)malloc(5 * sizeof(int));
	for (int i = 0; i < 5; ++i)
	{
		p[i] = i;
	}

	free(p);*/

	//C++
	//int* p = new int[5];
	//delete []p;

	/*int a;
	a = 3;
	f(a);*/

	/*
	int numbers[5];
	int *p = nullptr;
	p = numbers;
	*p = 10;
	p++;
	*p = 20;
	p = &numbers[2];
	*p = 40;
	p = numbers + 3;
	*p = 50;
	p = numbers;
	*(p + 4) = 30;

	for (int i = 0; i < 5; ++i)
	{
		cout << numbers[i]<<' ';
	}
	//10 20 40 50 30
	*/
	
	Catalog* c;

	c = CreareCatalog();
	cout << "Numele sortate alfabetic sunt:" << endl;
	c->sortareAlfabetica(c->nume, c->nrStudenti);
	AfisareVSiruri(c->nume, c->nrStudenti);
	cout << "Numele sortate dupa lungimei sunt:" << endl;
	c->sortareLungime(c->nume, c->nrStudenti);
	AfisareVSiruri(c->nume, c->nrStudenti);
	DistrugereCatalog(c);

	system("PAUSE");
	return 0;
}