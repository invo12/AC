#include "Complex.h"

int main()
{
	Complex a, b,c,d;
	a.citire();
	b.citire();
	c = a - b;
	c.afisare();
	cout << (a == b) << ' ' << ~a << ' ' << ~b;
	system("PAUSE");
	return 0;
}