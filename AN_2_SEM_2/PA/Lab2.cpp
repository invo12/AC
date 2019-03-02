#include<time.h>
#include<iostream>

using namespace std;

struct Nod
{
	int data;
	Nod* next;
};
void InserareI(Nod*& I, int val, int& c);
void InserareP(Nod*& P, int val, int& c);
void Afisare(Nod* head);
void InserarePO1(Nod*& P, int val, int& c);

int main()
{
	Nod* l1 = nullptr;
	Nod* l2 = nullptr;
	Nod* l3 = nullptr;
	int c1 = 0, c2 = 0,c3 = 0;
	clock_t init, fin;
	double rez;
	init = clock();
	for (int i = 0; i < 10000; ++i)
	{
		InserareI(l1, i, c1);
	}
	//Afisare(l1->next);
	fin = clock();
	rez = (double)(fin - init) / CLOCKS_PER_SEC;
	cout << "Lista Ionescu: " << c1 << " timp: " << rez << endl;

	init = clock();
	for (int i = 0; i < 10000; ++i)
	{
		InserareP(l2, i, c2);
	}
	//Afisare(l2);
	fin = clock();
	rez = (double)(fin - init) / CLOCKS_PER_SEC;
	cout << "Lista Popescu: " << c2 << " timp: " << rez << endl;

	init = clock();
	for (int i = 0; i < 10000; ++i)
	{
		InserarePO1(l3, i, c3);
	}
	//Afisare(l3);
	fin = clock();
	rez = (double)(fin - init) / CLOCKS_PER_SEC;
	cout << "Lista Popescu O(1): " << c3 << " timp: " << rez << endl;

	Dealocare(l1);
	Dealocare(l2);
	Dealocare(l3);
}

void InserareI(Nod*& I, int val, int& c)
{
	Nod *p = new Nod;
	p->data = val;
	if ((++c) != 0 && I == 0)
	{
		p->next = p;
	}
	else
	{
		p->next = I->next;
		I->next = p;
	}
	I = p;
}
void InserareP(Nod*& P, int val, int& c)
{
	Nod* q = P;
	if ((++c) != 0 && P == 0)
	{
		q = new Nod;
		q->data = val;
		q->next = q;
		P = q;
	}
	else
	{
		while ((++c) != 0 && q->next != P)
		{
			q = q->next;
		}
		--c;
		InserareI(q, val, c);
	}
}
//se insereaza dupa primul elem si se inverseaza valorile din primele 2
void InserarePO1(Nod*& P, int val, int& c)
{
	Nod* q = new Nod;
	q->data = val;
	if ((++c) != 0 && P == 0)
	{
		q->next = q;
	}
	else
	{
		q->next = P->next;
		P->next = q;
		int aux = P->data;
		P->data = q->data;
		q->data = aux;
	}
	P = q;
}
void Afisare(Nod* head)
{
	Nod* q = head;
	while (q->next != head)
	{
		cout << q->data << ' ';
		q = q->next;
	}
	cout << q->data << endl;
}