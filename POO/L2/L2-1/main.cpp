#include "Header.h"

int main()
{
	student* p = nullptr;
	int n;
	cout << "Dati nr studenti:";
	cin >> n;
	p = new student[n];
	for (int i = 0; i < n; ++i)
	{
		p[i].read = ReadData;
		p[i].write = WriteData;
	}
	for (int i = 0; i < n; ++i)
	{
		p[i].read(&p[i]);
	}
	for (int i = 0; i < n; ++i)
	{
		p[i].write(&p[i]);
	}

	system("PAUSE");

	return 0;
}