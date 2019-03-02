#include "MultimeComplexe.h"

int main() {
	MultimeComplexe m;
	Complex c1(2, 3), c2(3, 4), c3(2, -1);
	m.adauga(c1);
	m.adauga(c2);
	m.afisare();
	m.extrage(c1);
	m.extrage(c3);
	m.afisare();
	m.adauga(c3);
	m.adauga(c3);
	m.afisare();
	system("PAUSE");
	return 0;
}