#include "Stiva.h"

int main()
{
	Stiva s;
	s.push(4);
	s.push(3);
	cout << s.top() << endl;
	s.push(9);
	cout << s.pop() << endl;
	s.push(2);
	s.print();
	system("PAUSE");
	return 0;
}