#pragma once
#include<iostream>
using namespace std;

class Complex
{
private:
	int re, im;
public:
	Complex();
	Complex(int re, int im) {
		this->re = re;
		this->im = im;
	}
	~Complex();
	void afisare();
	int egal(Complex c2);
	void citire();
};

