#include "Multime.h"

Multime::Multime()
{
	dim = 15;
	n = 0;
	date = new int[dim];
}

Multime::Multime(int d)
{
	if (d < 0)
		return;
	dim = d;
	n = 0;
	date = new int[dim];
}

Multime::~Multime()
{
	if (date != nullptr)
		delete[] date;
}

void Multime::adauga(int a)
{
	if (n == dim - 1)
		cout << "Multime plina";
	for (int i = 0; i < n; ++i)
	{
		if (date[i] == a)
		{
			return;
		}
	}
	date[n] = a;
	++n;
}

void Multime::extrage(int a)
{
	for (int i = 0; i < n-1; ++i)
	{
		if (date[i] == a)
		{
			for (int j = i; j < n-1; ++j)
			{
				date[j] = date[j + 1];
			}
			--n;
			return;
		}
	}
	if (date[n - 1] == a)
		--n;
}

void Multime::afisare()
{
	for (int i = 0; i < n; ++i)
	{
		cout << date[i] << ' ';
	}
	cout << endl;
}