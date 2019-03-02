#include "CAircraft.h"
#include "CGlider.h"
#include "CAirplane.h"
#include "FlyingObj.h"
int main()
{
	CAirplane A1;
	CAirplane A2("ALex", 1,0,0);
	A2 = A1;
	A2.afisare();
	
	cin >> A1;
	cout << A1;

	CAirCraft* p = CreateAircraft(FlyingObj::CAircraftType::GLIDER, FlyingObj::CGliderType::OPEN);//namespace
	p->afisare();

	CAirCraft* x[3]; //Polimorfism
	x[0] = &A1;
	x[1] = &A2;
	x[2] = p;

	x[0]->afisare();
	x[1]->afisare();
	x[2]->afisare();

	cout << endl;
	cout << CAirCraft::GetCounter();
	system("Pause");
	return 0;
}