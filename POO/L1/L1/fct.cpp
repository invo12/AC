#include<iostream>
#include<string.h>
#include "Header.h"
using namespace std;

Catalog* CreareCatalog()
{
	Catalog* c = (Catalog*)malloc(sizeof(Catalog));
	cout << "Dati nr studenti";
	cin >> c->nrStudenti;
	cout << "Dati numele studentilor";
	c->citire = citireVSiruri;
	c->sortareAlfabetica = sortareVSiruri;
	c->sortareLungime = SortareLungime;
	c->nume = citireVSiruri(c->nrStudenti);
	return c;
}

void DistrugereCatalog(Catalog* c)
{
	dealocareVSiruri(c->nume, c->nrStudenti);
	free(c);
}
char **citireVSiruri(int n)
{
	char buffer[100];
	char **vsiruri = (char**)calloc(n, sizeof(char*));
	cin.ignore(100, '\n');
	for (int i = 0; i < n; ++i)
	{
		int len;
		cin.getline(buffer, 100);
		len = strlen(buffer);
		vsiruri[i] = (char*)calloc(len + 1, sizeof(char));
		strcpy(vsiruri[i], buffer);
	}
	return vsiruri;
}

void sortareVSiruri(char **vsiruri, int n)
{
	int suntPerm = 1;
	while (suntPerm)
	{
		suntPerm = 0;
		for (int i = 0; i < n - 1; ++i)
		{
			if (strcmp(vsiruri[i], vsiruri[i + 1]) > 0)
			{
				char* aux = vsiruri[i];
				vsiruri[i] = vsiruri[i+1];
				vsiruri[i+1] = aux;
				suntPerm = 1;
			}
		}
	}
}
void SortareLungime(char**sir, int n)
{
	bool ok = false;
	if (!ok)
	{
		ok = true;
		for (int i = 0; i < n - 1; ++i)
		{
			if (strlen(sir[i]) > strlen(sir[i + 1]))
			{
				char* aux = sir[i];
				sir[i] = sir[i + 1];
				sir[i + 1] = aux;
				ok = false;
			}
		}
	}
}

void AfisareVSiruri(char **vsiruri, int n)
{
	for (int i = 0; i < n; ++i)
	{
		cout << vsiruri[i] << endl;
	}
}

void dealocareVSiruri(char **vsiruri, int n)
{
	for (int i = 0; i < n; ++i)
	{
		free(vsiruri[i]);
	}
	free(vsiruri);
}