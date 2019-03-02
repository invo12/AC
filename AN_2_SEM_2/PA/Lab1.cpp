#include<iostream>
using namespace std;

//p1
struct Nod
{
	int data;
	Nod* next, *prev;
};

void InserareFata(Nod*& head, int x);
void InserarePozitie(Nod*& head, int poz, int x);
void InserareDupa(Nod* q, int x);
void AfisareLista(Nod* head);

//p2
void Rotire(char a[100][100],int n);
void Afisare(char a[100][100], int n);

int main()
{
	//p1
	Nod* cap = nullptr;
	for (int i = 0; i < 5; ++i)
	{
		InserarePozitie(cap, 0, i);
	}
	InserarePozitie(cap, 6, 10);
	AfisareLista(cap);
	//p2
	/*char a[100][100] = { {'a','b','c'},{'d','e','f'},{'g','h','i'} };
	Afisare(a, 3);
	Rotire(a,3);
	Afisare(a, 3);*/
	return 0;
}
//p1
void InserarePozitie(Nod*& head, int poz,int x)
{
	if (poz == 0)
	{
		InserareFata(head,x);
		return;
	}
	Nod* q = head;
	int k = 0;
	while (k < poz && q->next != nullptr)
	{
		q = q->next;
		k++;
	}
	if (q->next == 0 && k == poz - 1)
	{
		InserareDupa(q,x);
		return;
	}
	else if (q->next == 0 && k < poz-1)
	{
		cout << "NR PREA MARE";
	}
	else
	{
		Nod* p = new Nod;
		p->data = x;
		p->next = q;
		p->prev = q->prev;
		q->prev = p;
		p->prev->next = p;
	}
}
void InserareFata(Nod*& head,int x)
{
	Nod* p = new Nod;
	p->data = x;
	if (head == nullptr)
	{
		p->next = nullptr;
		p->prev = nullptr;
	}
	else
	{
		p->next = head;
		p->prev = nullptr;
		head->prev = p;
	}
	head = p;
}
void InserareDupa(Nod* q, int x)
{
	Nod* p = new Nod;
	p->data = x;
	p->next = nullptr;
	p->prev = q;
	q->next = p;
}
void AfisareLista(Nod* head)
{
	while (head != nullptr)
	{
		cout << head->data << ' ';
		head = head->next;
	}
	cout << endl;
}
//p2
void Rotire(char a[100][100],int n)
{
	char aux;
	for (char i = 0; i < n/2; ++i)
	{
		for (int j = 0;j < n;++j)
		{
			aux = a[i][j];
			a[i][j] = a[n - i - 1][j];
			a[n - i - 1][j] = aux;
		}
	}
	for (int i = 0; i < n; ++i)
	{
		for (int j = 0; j < n - i - 1; ++j)
		{
			aux = a[i][j];
			a[i][j] = a[n-j-1][n - i - 1];
			a[n-j-1][n - i - 1] = aux;
		}
	}
}
void Afisare(char a[100][100], int n)
{
	for (int i = 0; i < n; ++i)
	{
		cout << endl;
		for (int j = 0; j < n; ++j)
		{
			cout << a[i][j] << ' ';
		}
	}
}