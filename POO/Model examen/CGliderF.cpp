#include "CGlider.h"

CGlider::CGlider() :CAirCraft()
{
	m_load = 0;
	m_class = 0;
}
CGlider::CGlider(char* Owner, int type, int clas, double load) : CAirCraft(Owner, type)
{
	m_class = clas;
	m_load = load;
}
CGlider::~CGlider()
{

}
CGlider::CGlider(const CGlider& Glide) :CAirCraft(Glide)
{
	m_class = Glide.m_class;
	m_load = Glide.m_load;
}
void CGlider::afisare()
{
	CAirCraft::afisare();
	cout << m_class << endl;
	cout << m_load << endl;
}
void CGlider::citire()
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
	cin >> m_class;
	cout << "Load :";
	cin >> m_load;
}
CGlider& CGlider::operator=(const CGlider& Glide)
{
	CAirCraft::operator=(Glide);
	m_class = Glide.m_class;
	m_load = Glide.m_load;

	return *this;
}

istream& operator>>(istream &s, CGlider &Glide);
ostream& operator<<(ostream &o, CGlider &Glide);