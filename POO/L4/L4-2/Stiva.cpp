#include "Stiva.h"

Stiva::Stiva()
{
	varf = -1;
}

Stiva::~Stiva()
{
}

void Stiva::push(int elem)
{
	if (varf < 50)
	{
		++varf;
		a[varf] = elem;
		return;
	}
	cout << "stiva plina";
}

int Stiva::pop()
{
	if (varf > -1)
	{
		--varf;
		return a[varf + 1];
	}
	cout << "stiva goala"<<endl;
	return -100000;
}
int Stiva::top()
{
	if (varf > -1)
	{
		return a[varf];
	}
	cout << "stiva goala"<<endl;
	return -100000;
}
void Stiva::print()
{
	for (int i = 0; i <= varf; ++i)
	{
		cout << a[i] << ' ';
	}
	cout << endl;
}