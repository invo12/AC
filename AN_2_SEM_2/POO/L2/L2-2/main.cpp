#include<iostream>
using namespace std;

struct student
{
	int nrTrecute;
	int nrPicate;
	void Read();
	void Write();
};

void student::Read()
{
	cin >> nrTrecute;
	cin >> nrPicate;
}

void student::Write()
{
	cout << "\ntrecute: " << nrTrecute << "\npicate: " << nrPicate;
}

int main()
{
	student a;
	a.Read();
	a.Write();

	system("PAUSE");
}