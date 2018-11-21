#include<iostream>
using namespace std;

struct catalog
{
	int n;
	char** nume;
	void SortareAlfabetica();
	void SortareLungime();
	void Afisare();
};

void catalog::SortareAlfabetica()
{
	int ok = 0;
	while (!ok)
	{
		ok = 1;
		for (int i = 0; i < n-1; ++i)
		{
			if (strcmp(nume[i], nume[i + 1]) > 0)
			{
				char* aux = nume[i];
				nume[i] = nume[i + 1];
				nume[i + 1] = aux;
				ok = 0;
			}
		}
	}
}

void catalog::Afisare()
{
	for (int i = 0; i < n; ++i)
	{
		cout << nume[i] << ' ';
	}
}

int main()
{
	catalog a;
	a.n = 5;
	a.nume = new char*[3];
	a.nume[0] = new char[6];
	a.nume[1] = new char[5];
	a.nume[2] = new char[7];
	a.nume[3] = new char[8];
	a.nume[4] = new char[5];
	cin >> a.nume[0] >> a.nume[1] >> a.nume[2] >> a.nume[3] >> a.nume[4];
	a.SortareAlfabetica();
	a.Afisare();

	system("PAUSE");
}

//Mihai Alex Andrei Catalin Bobo