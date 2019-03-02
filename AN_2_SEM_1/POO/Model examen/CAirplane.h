#pragma once
#include "CAircraft.h"

class CAirplane :public CAirCraft
{
private:
	int m_propulsion;
	double m_speed;
public:
	CAirplane();
	CAirplane(char* Owner, int type, int propulsion, double speed);
	~CAirplane();
	void afisare() override;
	void citire() override;
	CAirplane(const CAirplane& Air);
	CAirplane& operator=(const CAirplane& Air);

	friend istream& operator >> (istream &s, CAirplane &Air)
	{
		char buffer[100];
		cout << "Cititi datele:" << endl;
		cout << "Nume owner :";
		if (Air.m_owner != nullptr)
		{
			delete[] Air.m_owner;
		}
		s >> buffer;
		Air.m_owner = new char[strlen(buffer) + 1];
		strcpy_s(Air.m_owner, strlen(buffer) + 1, buffer);
		cout << "Tipul :";
		s >> Air.m_type;
		cout << "Propulsion :";
		s >> Air.m_propulsion;
		cout << "Speed :";
		s >> Air.m_speed;

		return s;
	}
	friend ostream& operator<<(ostream &o, CAirplane &Air)
	{
		o << Air.m_owner << endl;
		o << Air.m_type << endl;
		o << Air.m_propulsion << endl;
		o << Air.m_speed << endl;

		return o;
	}
};