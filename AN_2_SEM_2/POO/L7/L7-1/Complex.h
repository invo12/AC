#pragma once
#include<iostream>
using namespace std;

class Complex {
	int re, im;
public:
	Complex();
	Complex(int, int);
	~Complex();
	void citire();
	void afisare();	Complex operator+(Complex a);	Complex operator-(Complex a);	Complex operator*(Complex a);	bool operator==(Complex a);	int operator~();};