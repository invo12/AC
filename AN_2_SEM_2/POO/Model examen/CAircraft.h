#pragma once
#include <iostream>

using namespace std;

class CAirCraft
{
private:
	static int m_counter;
protected:
	char* m_owner;
	int m_type;
public:
	CAirCraft();
	CAirCraft(char*, int);
	virtual ~CAirCraft();
	CAirCraft(const CAirCraft&);
	virtual void afisare() = 0;
	virtual void citire() = 0;
	CAirCraft& operator=(const CAirCraft&);

	static int GetCounter();
};

CAirCraft* CreateAircraft(int type, int option);
