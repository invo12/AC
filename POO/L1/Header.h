#pragma once

struct Catalog
{
	int nrStudenti;
	char** nume;
	char**(*citire)(int);
	void(*sortareAlfabetica)(char**, int);
	void(*sortareLungime)(char**, int);
};

Catalog* CreareCatalog();
void DistrugereCatalog(Catalog* c);

char **citireVSiruri(int n);
void sortareVSiruri(char **vsiruri, int n);
void SortareLungime(char**sir, int n);
void AfisareVSiruri(char **vsiruri, int n);
void dealocareVSiruri(char **vsiruri, int n);
