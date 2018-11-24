#include "MultimeComplexe.h"

MultimeComplexe::MultimeComplexe()
{
	dim = 20;
	v = new Complex[dim];
	n = 0;
}

MultimeComplexe::MultimeComplexe(int d)
{
	dim = d;
	v = new Complex[dim];
	n = 0;
}

MultimeComplexe::~MultimeComplexe()
{
	if (v != nullptr)
	{
		delete[] v;
		v = nullptr;
	}
}

void MultimeComplexe::adauga(Complex a)
{
	if (n >= dim)
	{
		cout << "Multime plina";
		return;
	}
	for (int i = 0; i < n; ++i)
	{
		if (a.egal(v[i]))
			return;
	}
	v[n] = a;
	++n;
}
void MultimeComplexe::extrage(Complex b)
{
	for (int i = 0; i < n; ++i)
	{
		if (b.egal(v[i]))
		{
			Complex aux = v[n - 1];
			v[n - 1] = v[i];
			v[i] = aux;
			--n;
			return;
		}
	}
}
void MultimeComplexe::afisare()
{
	cout << "Multimea este:" << endl;
	for (int i = 0; i < n; ++i)
	{
		v[i].afisare();
	}
	cout << endl;
}