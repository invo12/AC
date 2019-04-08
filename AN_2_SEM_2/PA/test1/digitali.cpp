#include<iostream>
using namespace std;

struct Nod
{
	Nod** fii;
	int payLoad;
};
void InitializareNod(Nod*& trie);
void InserareCar(Nod* trie, char c);
void InserareSir(Nod* trie, string sir);
bool Cautare(Nod* trie, string val);

int main()
{
	int contor = 0;
	Nod* trie = nullptr;
	InitializareNod(trie);
	InserareSir(trie, "ana");
	InserareSir(trie, "ananas");
}

//bool Cautare(Nod* trie, string val)
//{
//	for (int i = 0; i < val.size(); ++i)
//	{
//		if (trie->fii[val[i] - 'a'] == 0)
//			return false;
//		trie = trie->fii[val[i] - 'a'];
//	}
//	if (trie->payLoad >= 0)
//		return true;
//	return false;
//
//}
//
//void InitializareNod(Nod*& trie)
//{
//	trie = new Nod;
//	trie->payLoad = -1;
//	trie->fii = new Nod*[27];
//	for (int i = 0; i < 27; ++i)
//	{
//		trie->fii[i] = 0;
//	}
//}
//
//void InserareSir(Nod* trie,string sir)
//{
//	for (int i = 0; i < sir.size(); ++i)
//	{
//		InserareCar(trie, sir[i]);
//		trie = trie->fii[sir[i] - 'a'];
//	}
//	if (trie->payLoad >= 0)
//	{
//		cout << "Deja inserat";
//	}
//	else
//	{
//		trie->payLoad = 1;
//	}
//}
//
//void InserareCar(Nod* trie,char c)
//{
//	if (trie->fii[c - 'a'] == 0)
//	{
//		Nod* p;
//		InitializareNod(p);
//		trie->fii[c - 'a'] = p;
//	}
//}

void InitializareNod(Nod*& trie)
{
	trie = new Nod;
	trie->payLoad = -1;
	trie->fii = new Nod*[27];
	for (int i = 0; i < 27; ++i)
	{
		trie->fii[i] = 0;
	}
}
void InserareCar(Nod* trie, char c)
{
	if (trie->fii[c - 'a'] == 0)
	{
		Nod* p;
		InitializareNod(p);
		trie->fii[c - 'a'] = p;
	}
}
bool Cautare(Nod* trie, string val)
{
	for (int i = 0; i < val.size(); ++i)
	{
		if (trie->fii[val[i] - 'a'] != 0)
		{
			trie = trie->fii[val[i] - 'a'];
		}
		else
		{
			return false;
		}
	}
	if (trie->payLoad == 1)
	{
		return true;
	}
	else
	{
		return false;
	}
}
void InserareSir(Nod* trie, string sir)
{
	for (int i = 0; i < sir.size(); ++i)
	{
		InserareCar(trie, sir[i]);
		trie = trie->fii[sir[i] - 'a'];
	}
	if (trie->payLoad == 1)
	{
		cout << "Cuvantul e inserat deja";
	}
	else
	{
		trie->payLoad = 1;
	}
}