#include "CAirplane.h"
CAirplane::CAirplane() :CAirCraft()
{
	m_propulsion = 0;
	m_speed = 0;
}
CAirplane::CAirplane(char* Owner, int type, int propulsion, double speed) : CAirCraft(Owner, type)
{
	m_propulsion = propulsion;
	m_speed = speed;
}
CAirplane::~CAirplane()
{

}
CAirplane::CAirplane(const CAirplane& Air) :CAirCraft(Air)
{
	m_propulsion = Air.m_propulsion;
	m_speed = Air.m_speed;
}
void CAirplane::afisare()
{
	CAirCraft::afisare();
	cout << m_propulsion << endl;
	cout << m_speed << endl;
}
void CAirplane::citire()
{
	char buffer[100];
	cout << "Cititi datele:" << endl;
	cout << "Nume owner :";
	if (m_owner != nullptr)
	{
		delete[] m_owner;
	}
	cin >> buffer;
	m_owner = new char[strlen(buffer) + 1];
	strcpy_s(m_owner, strlen(buffer) + 1, buffer);
	cout << "Tipul :";
	cin >> m_type;
	cout << "Clasa :";
	cin >> m_propulsion;
	cout << "Load :";
	cin >> m_speed;
}
CAirplane& CAirplane::operator=(const CAirplane& Air)
{
	CAirCraft::operator=(Air);
	m_propulsion = Air.m_propulsion;
	m_speed = Air.m_speed;

	return *this;
}

istream& operator >> (istream &s, CAirplane &Glide);
ostream& operator<<(ostream &o, CAirplane &Glide);