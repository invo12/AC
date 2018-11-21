//#include "Catalog.h"
//int main(void)
//{
//	int operatie;
//	PFnComparare unPointerLaOFunctieDeComparare;
//	Catalog catalogulAnului2;
//	catalogulAnului2.citire();
//	catalogulAnului2.afisare();
//	do {
//		do {
//			cout << "Ce doriti sa efectuati?" << endl;
//			cout << "0.Iesire din program;" << endl;
//			cout << "1 - sortare alfabetica a numelor;" << endl;
//			cout << "2 - sortare descrescatoare dupa nota;" << endl;
//			cout << "3 - sortare dupa lungimea numelui - crescator." << endl;
//			cin >> operatie;
//		} while ((operatie < 0) || (operatie > 3));
//		switch (operatie)
//		{
//		case 1:
//			cout << "1 - sortare alfabetica a numelor;" << endl;
//			unPointerLaOFunctieDeComparare = comparNumeAlfabetic;
//			catalogulAnului2.setComparator(unPointerLaOFunctieDeComparare);
//			catalogulAnului2.sortare();
//			break;
//		case 2:
//			cout << "2 - sortare descrescatoare dupa nota;" << endl;
//			unPointerLaOFunctieDeComparare = comparNoteDescrescator;
//			catalogulAnului2.setComparator(unPointerLaOFunctieDeComparare);
//			catalogulAnului2.sortare();
//			break;
//		case 3:
//			cout << "3 - sortare dupa lungimea numelui - crescator." << endl;
//			unPointerLaOFunctieDeComparare = comparNumeDupaLungimeCrescator;
//			catalogulAnului2.setComparator(unPointerLaOFunctieDeComparare);
//			catalogulAnului2.sortare();
//			break;
//		default:
//			cout << "Sfarsitul executiei programului." << endl;
//		}
//		catalogulAnului2.afisare();
//	} while (operatie);
//	catalogulAnului2.elibMemorie();
//	
//	/*Student a;
//	a.citire();
//	a.afisare();
//	a.elibMem();*/
//
//	//Grupa b;
//	//b.citire();
//	//b.comparator = comparNumeAlfabetic;
//	//b.bSort();
//	//b.afisare();
//	//b.elibMem();
//
//	system("PAUSE");
//	return 0;
//}
////3 3 1209A 10 Alex 9 Stefan 8 Mihai 4 1209B 10 Rosu 9 Sandu 10 Georgiana 7 Andrei 3 1210A 10 Andrei 12 Raul 5 Robert

#include<stdio.h>
#include <iostream>
using namespace std;

int main()
{
	int i = 10;
	printf("%d %d", i++,++i);
	i = 10;
	printf("%d %d", ++i, i++);
	system("PAUSE");
}