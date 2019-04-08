#include<iostream>
using namespace std;

unsigned long long int Inmultire(unsigned long long int x, unsigned long long int y);
unsigned long long int InmultireOpt(unsigned long long int x, unsigned long long int y);
int nrCif(unsigned long long int a);

int main()
{
	cout << 144 * 255 << endl << Inmultire(144, 255) << endl;
	cout<< 144  * 255 <<endl << InmultireOpt(144,255);
}

int nrCif(unsigned long long int a)
{
	int c = 0;
	while (a != 0)
	{
		a /= 10;
		c++;
	}
	return c;
}

unsigned long long int Inmultire(unsigned long long int x, unsigned long long int y)
{
	if (x < 10 && y < 10)
	{
		return x * y;
	}
	unsigned long long int k,k10 = 1,k20 = 1;		//k10 = 10^(numar_cifre/2),k20 = 10 ^ numar_cifre;
	if (x < y)
	{
		k = nrCif(y);
	}
	else
	{
		k = nrCif(x);
	}
	k = k / 2;
	for (int i = 0; i < 2 * k; ++i)
	{
		k20 *= 10;
	}
	for (int i = 0; i < k; ++i)
	{
		k10 *= 10;
	}
	unsigned long long int a = x / k10;
	unsigned long long int b = x % k10;
	unsigned long long int c = y / k10;
	unsigned long long int d = y % k10;
	return Inmultire(a, c) * k20 + (Inmultire(a, d) + Inmultire(b, c))*k10 + Inmultire(b, d);
}

unsigned long long int InmultireOpt(unsigned long long int x, unsigned long long int y)
{
	if (x < 10 && y < 10)
	{
		return x * y;
	}
	unsigned long long int k, k10 = 1, k20 = 1;		//k10 = 10^(numar_cifre/2),k20 = 10 ^ numar_cifre;
	if (x < y)
	{
		k = nrCif(y);
	}
	else
	{
		k = nrCif(x);
	}
	k = k / 2;
	for (int i = 0; i < 2 * k; ++i)
	{
		k20 *= 10;
	}
	for (int i = 0; i < k; ++i)
	{
		k10 *= 10;
	}
	unsigned long long int a = x / k10;
	unsigned long long int b = x % k10;
	unsigned long long int c = y / k10;
	unsigned long long int d = y % k10;
	unsigned long long int temp1 = Inmultire(a, c);
	unsigned long long int temp2 = Inmultire(b,d);
	return temp1 * k20 + (Inmultire(a-b,d-c) + temp1 + temp2)*k10 + temp2;	//ad + bc = (a-b)(d-c) + ac + bd 
}