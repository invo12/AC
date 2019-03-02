#pragma once
#include<iostream>
using namespace std;

class String
{
	int size;
	char* sir;
public:
	String();
	String(char* s);
	String(const String& a);
	~String();

	String operator+(const String &a);
	String& operator=(const String &a);
	bool operator==(const String &a);
	
	int cauta(String subsir);
	void afisare();
	int compara(String sir2);
};

