#include<iostream>
#include<vector>
#include<algorithm>
#include<fstream>
#include<limits.h>
using namespace std;

/*arbori ponderati
struct Nod
{
	int data;
	Nod* fiuStg, *fiuDrt;
};

bool f(Nod* a, Nod* b)
{
	return a->data > b->data;
}

void afisareVector(vector<Nod*> v)
{
	for (int i = 0; i < v.size(); ++i)
	{
		cout << v[i]->data << ' ';
	}
	cout << endl;
}

int main()
{
	vector<Nod*> v;
	for (int i = 0; i < 8; ++i)
	{
		Nod* a = new Nod();
		cin>>a->data;
		a->fiuStg = a->fiuDrt = nullptr;
		v.push_back(a);
	}
	make_heap(v.begin(), v.end(), f);
	while (v.size() > 1)
	{
		Nod* t1 = v.front();
		v.erase(v.begin());
		Nod* t2 = v.front();
		v.erase(v.begin());
		Nod* r = new Nod;
		r->data = t1->data + t2->data;
		r->fiuStg = t1;
		r->fiuDrt = t2;
		v.push_back(r);
		make_heap(v.begin(), v.end(), f);
		afisareVector(v);
	}
	system("PAUSE");
}
*/

/* DIJKSTRA

ifstream f("in.txt");
ofstream g("out.txt");

bool amCeVizita(int* s, int n);
int IndiceMinim(int* distanta, int* vizitat, int n);

int main()
{
	int **a, *distanta, *vizitat, *predecesori, start, n;
	f >> n;
	a = new int*[n];
	distanta = new int[n];
	vizitat = new int[n];
	predecesori = new int[n];
	for (int i = 0; i < n; ++i)
	{
		vizitat[i] = 0;
	}
	for (int i = 0; i < n; ++i)
	{
		a[i] = new int[n];
		for (int j = 0; j < n; ++j)
		{
			f >> a[i][j];
			if (a[i][j] == -1)
			{
				a[i][j] = INT_MAX;
			}
		}
	}
	f >> start;
	for (int i = 0; i < n; ++i)
	{
		distanta[i] = a[start][i];
		predecesori[i] = start;
	}
	vizitat[start] = 1;
	while (amCeVizita(vizitat, n))
	{
		int i = IndiceMinim(distanta, vizitat, n);
		vizitat[i] = 1;
		for (int j = 0; j < n; ++j)
		{
			if (vizitat[j] == 1 || a[i][j] == INT_MAX)
				continue;
			if (distanta[j] > distanta[i] + a[i][j])
			{
				distanta[j] = distanta[i] + a[i][j];
				predecesori[j] = i;
			}
		}
	}
	for (int i = 0; i < n; ++i)
	{
		g << distanta[i] << ' ';
	}
	g << endl;
	for (int i = 0; i < n; ++i)
	{
		g << predecesori[i] << ' ';
	}
}
bool amCeVizita(int *s, int n)
{
	for (int i = 0; i < n; ++i)
	{
		if (s[i] == 0)
			return true;
	}
	return false;
}
int IndiceMinim(int* distanta, int* vizitat, int n)
{
	int min = INT_MAX;
	for (int i = 0; i < n; ++i)
	{
		if (vizitat[i] == 1)
			continue;
		if (min > distanta[i])
		{
			min = distanta[i];
		}
	}
	for (int i = 0; i < n; ++i)
	{
		if (vizitat[i] == 1)
			continue;
		if (min == distanta[i])
			return i;
	}
}
*/

/*
ifstream f("in.txt");
ofstream g("out.txt");

int main()
{
	int **a,n,**distanta,**predecesori;
	f >> n;
	a = new int*[n];
	distanta = new int*[n];
	predecesori = new int*[n];
	for (int i = 0; i < n; ++i)
	{
		predecesori[i] = new int[n];
		a[i] = new int[n];
		distanta[i] = new int[n];
		for (int j = 0; j < n; ++j)
		{
			f >> a[i][j];
			predecesori[i][j] = i;
			if (a[i][j] == -1)
			{
				predecesori[i][j] = -1;
				a[i][j] = INT_MAX;
			}
		}
		distanta[i][i] = 0;
	}
	for (int i = 0; i < n; ++i)
	{
		for (int j = 0; j < n; ++j)
		{
			if(i != j)
				distanta[i][j] = a[i][j];
		}
	}
	for (int k = 0; k < n; ++k)
	{
		for (int i = 0; i < n; ++i)
		{
			for (int j = 0; j < n; ++j)
			{
				if (distanta[i][k] == INT_MAX || distanta[k][j] == INT_MAX)
					continue;
				if (distanta[i][j] > distanta[i][k] + distanta[k][j])
				{
					distanta[i][j] = distanta[i][k] + distanta[k][j];
					predecesori[i][j] = k;
				}
			}
		}
	}
	for (int i = 0; i < n; ++i)
	{
		for (int j = 0; j < n; ++j)
		{
			if (distanta[i][j] != INT_MAX)
				g << distanta[i][j] << ' ';
			else
				g << -1 << ' ';
		}
		g << endl;
	}
	for (int i = 0; i < n; ++i)
	{
		for (int j = 0; j < n; ++j)
		{
			g << predecesori[i][j] << ' ';
		}
		g << endl;
	}
}
*/


//80 20 40 100 30 10 70 50