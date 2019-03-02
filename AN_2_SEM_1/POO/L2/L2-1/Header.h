#pragma once
#include<iostream>
using namespace std;

struct student
{
	int numarMatricol;
	char nume[50];
	char gen;
	float nota;
	void (*read)(student* st);
	void(*write)(student* st);
};

void ReadData(student* st);
void WriteData(student* st);