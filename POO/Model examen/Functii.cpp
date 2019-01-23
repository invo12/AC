#include "CAircraft.h"
#include "CAirplane.h"
#include "CGlider.h"

int CAirCraft::m_counter = 0;
CAirCraft::CAirCraft()
{
	m_owner = nullptr;
	m_type = 0;
	m_counter++;
}
CAirCraft::~CAirCraft()
{
	if (m_owner != nullptr)
	{
		delete[] m_owner;
		m_owner = nullptr;
	}
	m_counter--;
}
CAirCraft::CAirCraft(char* Owner, int Type)
{
	m_type = Type;
	m_counter++;
	m_owner = new char[strlen(Owner) + 1];
	strcpy_s(m_owner, strlen(Owner) + 1, Owner);
}
CAirCraft::CAirCraft(const CAirCraft& Air)
{
	this->m_type = Air.m_type;
	if (strlen(this->m_owner) != strlen(Air.m_owner))
	{
		delete[] m_owner;
		m_owner = new char[strlen(Air.m_owner) + 1];
		strcpy_s(m_owner, strlen(Air.m_owner) + 1, Air.m_owner);
	}
	else
	{
		strcpy_s(m_owner, strlen(Air.m_owner) + 1, Air.m_owner);
	}
}
void CAirCraft::afisare()
{
	cout << m_type << endl;
	cout << m_owner << endl;
	cout << endl;
}
CAirCraft& CAirCraft::operator=(const CAirCraft& Air)
{
	m_type = Air.m_type;
	if (Air.m_owner != nullptr)
	{
		m_owner = new char[strlen(Air.m_owner) + 1];
		strcpy_s(m_owner, strlen(Air.m_owner) + 1, Air.m_owner);
	}
	return *this;
}
int CAirCraft::GetCounter()
{
	return m_counter;
}

CAirCraft* CreateAircraft(int type, int option)
{
	CAirCraft* New = nullptr;
	if (type == 1)
	{
		if (option == 0)
		{
			New = new CAirplane("NONE", 1, 0, 0);
		}
		if (option == 1)
		{
			New = new CAirplane("JET", 1, 0, 0);
		}
		if (option == 2)
		{
			New = new CAirplane("PROPELLER", 1, 0, 0);
		}
	}
	if (type == 2)
	{
		if (option == 1)
		{
			New = new CGlider("CLUB", 2, 0, 0);
		}
		if (option == 2)
		{
			New = new CGlider("STANDARD", 2, 0, 0);
		}
		if (option == 3)
		{
			New = new CGlider("DUAL_SEATS", 2, 0, 0);
		}
		if (option == 4)
		{
			New = new CGlider("OPEN", 2, 0, 0);
		}
	}
	return New;
}