#pragma once
#include "Complex.h"
class MultimeComplexe
{
private:
	Complex *v;
	int dim;
	int n;
public:
	MultimeComplexe();
	MultimeComplexe(int d);
	~MultimeComplexe();

	void adauga(Complex a);
	void extrage(Complex b);
	void afisare();
};

