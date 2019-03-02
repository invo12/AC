#pragma once
#include<iostream>
using namespace std;

class Multime
{
private:
	int *date;
	int dim;
	int n;
public:
	Multime();
	Multime(int d);
	void adauga(int a);
	void extrage(int a);
	void afisare();
	~Multime();
};

