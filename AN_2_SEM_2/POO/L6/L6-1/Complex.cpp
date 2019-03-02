#include "Complex.h"

Complex::Complex()
{
	re = im = 0;
}

Complex::~Complex()
{
}

void Complex::afisare() {
	cout << "(" << re << "," << im << ")" << endl;
}

int Complex::egal(Complex c2)
{
	if (this->re == c2.re && this->im == c2.im)
		return 1;
	return 0;
}

void Complex::citire()
{
	cout << "Dati nr complex" << endl << "parte reala: ";
	cin >> re;
	cout << "parte imaginara: ";
	cin >> im;
}