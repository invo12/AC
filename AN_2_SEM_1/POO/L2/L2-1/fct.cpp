#include "Header.h"

void ReadData(student* st)
{
	cout << "Dati nr matricol ";
	cin >> st->numarMatricol;
	cout << "Dati numele ";
	cin.get();
	cin.get(st->nume, 30);
	cout << "dati genul ";
	cin >> st->gen;
	cout << "dati nota ";
	cin >> st->nota;
}

void WriteData(student* st)
{
	cout << "\nNr matricol:" << st->numarMatricol;
	cout << "\nnume:" << st->nume;
	cout << "\ngenul:" << st->gen;
	cout << "\nnota:" << st->nota;
}