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

Multime::Multime(const Multime& a)
{
	date = new int[a.dim];
	dim = a.dim;
	n = a.n;
	for (int i = 0; i < n; ++i)
	{
		date[i] = a.date[i];
	}
}

Multime::~Multime()
{
	if (date != nullptr)
	{
		delete[] date;
		date = nullptr;
	}
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
	for (int i = 0; i < n - 1; ++i)
	{
		if (date[i] == a)
		{
			for (int j = i; j < n - 1; ++j)
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

void Multime::operator+=(int a)
{
	adauga(a);

}

void Multime::operator-=(int a)
{
	extrage(a);

}

Multime& Multime::operator =(const Multime &a)
{
	if (date != nullptr)
	{
		delete[] date;
		date = nullptr;
	}
	date = new int[a.dim];
	dim = a.dim;
	n = a.n;
	for (int i = 0; i < n; ++i)
	{
		date[i] = a.date[i];
	}
	return *this;
}

void Multime::operator+=(const Multime &a)
{
	Multime temp;
	if (temp.date != nullptr)
	{
		delete[] temp.date;
		temp.date = nullptr;
	}
	temp.date = new int[a.dim + dim];
	temp.dim = a.dim + dim;
	temp.n = 0;
	for (int i = 0; i < a.n; ++i)
	{
		temp += a.date[i];
	}
	for (int i = 0; i < n; ++i)
	{
		temp += date[i];
	}
	*this = temp;
}

Multime Multime::operator+(Multime a)
{
	Multime temp;
	if (temp.date != nullptr)
	{
		delete[] temp.date;
		temp.date = nullptr;
	}
	temp.date = new int[a.dim + dim];
	temp.dim = a.dim + dim;
	temp.n = 0;
	for (int i = 0; i < a.n; ++i)
	{
		temp += a.date[i];
	}
	for (int i = 0; i < n; ++i)
	{
		temp += date[i];
	}
	return temp;
}