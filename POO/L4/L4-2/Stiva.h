#pragma once
#include<iostream>
using namespace std;

class Stiva
{
private:
	int a[50];
	int varf;
public:
	void push(int elem);
	int pop();
	int top();
	void print();
	Stiva();
	~Stiva();
};

