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
	Multime(const Multime& a);

	void operator+=(int a);
	void operator-=(int a);
	Multime& operator =(const Multime &a);
	Multime operator+(Multime a);
	void operator+=(const Multime &a);
	void adauga(int a);
	void extrage(int a);
	void afisare();
	~Multime();
};