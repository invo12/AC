#include "Complex.h"

Complex::Complex()
{
	re = im = 0;
}
Complex::Complex(int a, int b)
{
	re = a;
	im = b;
}
Complex::~Complex()
{
}

void Complex::citire()
{
	cout << "Dati nr complex" << endl << "parte reala: ";
	cin >> re;
	cout << "parte imaginara: ";
	cin >> im;
}

void Complex::afisare() {
	cout << "(" << re << "," << im << ")" << endl;
}

Complex Complex::operator+(Complex a)
{
	Complex temp;
	temp.re = this->re + a.re;
	temp.im = this->im + a.im;
	return temp;
}

Complex Complex::operator-(Complex a)
{
	Complex temp;
	temp.re = this->re - a.re;
	temp.im = this->im - a.im;
	return temp;
}


Complex Complex::operator*(Complex a)
{
	Complex temp;
	temp.re = this->re * a.re;
	temp.im = this->im * a.im;
	return temp;
}

bool Complex::operator==(Complex a)
{
	if(this->re == a.re && this->im == a.im)
		return true;
	return false;
}

int Complex::operator~()
{
	return (this->re * this->re + this->im * this->im);
}