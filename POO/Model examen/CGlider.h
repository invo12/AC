#pragma once
#include "CAircraft.h"

class CGlider : public CAirCraft
{
private:
	int m_class;
	double m_load;
public:
	CGlider();
	CGlider(char* Owner, int type, int clas, double load);
	~CGlider();
	void afisare() override;
	void citire() override;
	CGlider(const CGlider& Glide);
	CGlider& operator=(const CGlider& Glide);

	friend istream& operator >> (istream &s, CGlider &G)
	{
		char buffer[100];
		cout << "Cititi datele:" << endl;
		cout << "Nume owner :";
		if (G.m_owner != nullptr)
		{
			delete[] G.m_owner;
		}
		s >> buffer;
		G.m_owner = new char[strlen(buffer) + 1];
		strcpy_s(G.m_owner, strlen(buffer) + 1, buffer);
		cout << "Tipul :";
		s >> G.m_type;
		cout << "Clasa :";
		s >> G.m_class;
		cout << "Load :";
		s >> G.m_load;

		return s;
	}
	friend ostream& operator<<(ostream &o, CGlider &G)
	{
		o << G.m_owner << endl;
		o << G.m_type << endl;
		o << G.m_class << endl;
		o << G.m_load << endl;

		return o;
	}
};