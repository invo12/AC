#include"String.h"

int main()
{
	String a;
	String b((char*)"Ana");
	String c(b);
	String d((char*)"aAna");
	b.afisare();
	c.afisare();
	a = b + c;
	cout << (c == b) << endl;
	cout << a.compara(c);
	cout <<endl<< a.cauta(d);
	a.afisare();
	system("PAUSE");
	return 0;
}