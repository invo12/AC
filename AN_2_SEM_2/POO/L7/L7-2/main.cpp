#include "Multime.h"

int main()
{
	Multime a;
	Multime b;
	b += 5;
	b += 4;
	a += 2;
	a += 3;
	a += 4;
	b += 7;
	Multime c;
	c = a + b;
	c.afisare();
	system("PAUSE");
	return 0;
}