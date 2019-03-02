#include "Catalog.h"

#pragma region GLOBAL

int comparNumeDupaLungimeCrescator(Student a, Student b)
{
	int rez = strlen(a.getNume()) - strlen(b.getNume());
	if (rez > 0)
		rez = 1;
	else if (rez < 0)
		rez = -1;
	//daca e 0 ramane 0
	return rez;
}

int comparNoteDescrescator(Student a, Student b)
{
	int rez = b.getNota() - a.getNota();
	if (rez > 0)
		rez = 1;
	else if (rez < 0)
		rez = -1;
	return rez;
}

int comparNumeAlfabetic(Student a, Student b)
{
	int rez = strcmp(a.getNume(), b.getNume());
	return rez;
}
#pragma endregion

#pragma region STUDENT

int _Student::getNota()
{
	return nota;
}

void _Student::setNota(int v)
{
	nota = v;
}

char* _Student::getNume()
{
	return nume;
}

void _Student::setNume(char unNume[])
{
	int lungime = strlen(unNume);
	nume = new char[strlen(unNume) + 1];	//+1 pt \0
	strcpy_s(nume,lungime+1,unNume);
}

void _Student::elibMem()
{
	delete nume;
	nume = nullptr;
}

void _Student::citire()
{
	char temp[100];
	int notaTemp;
	cout << "Dati nota studentului: ";
	cin >> notaTemp;
	setNota(notaTemp);
	cin.get();
	cout << "Dati numele studentului: ";
	cin.get(temp,100);
	setNume(temp);
}

void _Student::afisare()
{
	cout << "Studentul " << nume << " are nota: " << nota;
}
#pragma endregion

#pragma region GRUPA

void _Grupa::citire()
{
	char temp[100];

	//cati studenti avem
	cout << "Dati nr studenti";
	cin >> nrStud;
	cin.get();
	
	//care e numele grupei
	cout << "Dati numele grupei";
	cin.get(temp,100);
	numeGrupa = new char[strlen(temp) + 1];
	strcpy_s(numeGrupa, strlen(temp) + 1, temp);

	//care sunt studentii nostri
	tabStudenti = new Student[nrStud];
	for (int i = 0; i < nrStud; ++i)
	{
		tabStudenti[i].citire();
	}
}

void _Grupa::elibMem()
{
	int s; //contor pentru parcurgerea studentilor din cadrul unei grupe
	if (numeGrupa)
	{
		delete numeGrupa;
		numeGrupa = nullptr;
	}
	for (s = 0; s < nrStud; s++)
		tabStudenti[s].elibMem();
	delete tabStudenti;
	tabStudenti = nullptr;
}

void _Grupa::afisare()
{
	cout << "Grupa " << numeGrupa << " are " << nrStud << " care se prezinta astfel\n";
	for (int i = 0; i < nrStud; ++i)
	{
		tabStudenti[i].afisare();
		cout << '\n';
	}
}

void _Grupa::bSort()
{
	int sortat = 0;
	while (!sortat)
	{
		sortat = 1;
		for (int i = 0; i < nrStud - 1; ++i)
		{
			if (comparator(tabStudenti[i], tabStudenti[i + 1]) > 0)
			{
				Student aux = tabStudenti[i];
				tabStudenti[i] = tabStudenti[i + 1];
				tabStudenti[i + 1] = aux;
				sortat = 0;
			}
		}
	}
}
#pragma endregion

#pragma region CATALOG

void _Catalog::setComparator(PFnComparare comparator)
{
	int i;									//contor pentru a parcurge grupele
	for (i = 0; i < nrGrupe; i++)
		tabGrupe[i].comparator = comparator;
}

void _Catalog::citire()
{
	//cati studenti avem
	cout << "Dati nr grupe";
	cin >> nrGrupe;

	//care sunt studentii nostri
	tabGrupe = new Grupa[nrGrupe];
	for (int i = 0; i < nrGrupe; ++i)
	{
		tabGrupe[i].citire();
	}
}

void _Catalog::afisare()
{
	for (int i = 0; i < nrGrupe; ++i)
	{
		tabGrupe[i].afisare();
		cout << '\n';
	}
}

void _Catalog::sortare()
{
	for (int i = 0; i < nrGrupe; ++i)
	{
		tabGrupe[i].bSort();
	}
}

void _Catalog::elibMemorie()
{
	for (int i = 0; i < nrGrupe; ++i)
	{
		tabGrupe[i].elibMem();
	}
	delete tabGrupe;
	tabGrupe = nullptr;
}
#pragma endregion