#include<iostream>
#include<vector>

using namespace std;

struct Punct
{
	int x,y;
};

Punct* punctNou(int x,int y)
{
	Punct* a;
	a = new Punct;
	a->x = x;
	a->y = y;
	return a;
}

vector<Punct*> interclasareGrafice(vector<Punct*> a, vector<Punct*> b)
{
	vector<Punct*> temp;
	int i = 0, j = 0;
	while (i < a.size() && j < b.size())
	{
		if (a[i]->x < b[j]->x)
		{
			temp.push_back(a[i]);
			++i;
		}
		else if(a[i]->x > b[j]->x)
		{
			temp.push_back(b[j]);
			++j;
		}
		else
		{
			if (a[i]->y > b[j]->y)
			{
				temp.push_back(a[i]);
			}
			else
			{
				temp.push_back(b[j]);
			}
			++i;
			++j;
		}
	}
	while (i < a.size())
	{
		temp.push_back(a[i]);
		++i;

	}
	while (j < b.size())
	{
		temp.push_back(b[j]);
		++j;
	}
	return temp;
}

void afisare(vector<Punct*> a)
{
	for (int i = 0; i < a.size(); ++i)
	{
		cout << a[i]->x << ' ' << a[i]->y << endl;
	}
	cout << endl;
}

vector<Punct*> puncte(vector<Punct*> a, int w, int p)
{
	vector<Punct*> temp;
	for (int i = 0; i < a.size(); ++i)
	{
		temp.push_back(punctNou(a[i]->x + w,a[i]->y + p));
	}
	return temp;
}

bool contine(vector<Punct*> a, int x,int y)
{
	for (int i = 0; i < a.size(); ++i)
	{
		if (a[i]->x == x && a[i]->y == y)
		{
			return true;
		}
	}
	return false;
}

void rucsac(int M, int n, int w[], int p[], int x[])
{
	vector<Punct*> s, t;
	s.push_back(punctNou(0, 0));
	t.push_back(punctNou(w[0], p[0]));
	for (int i = 1; i < n; ++i)
	{
		s = interclasareGrafice(s, t);
		t = puncte(s, w[i], p[i]);
	}
	afisare(s);
	int xx = 0;
	int yy = 0;
	for (int i = s.size() - 1; i >= 0; --i)
	{
		if (s[i]->x <= M)
		{
			xx = s[i]->x;
			yy = s[i]->y;
			break;
		}
	}
	for (int i = 0 ; i < n; ++i)
	{
		if (contine(s, xx - w[i], yy - p[i]))
		{
			x[i] = 1;
			xx -= w[i];
			yy -= p[i];
		}
	}
	for (int i = 0; i < n; ++i)
	{
		if (x[i])
			cout << i << ' ';
	}
}
int main()
{
	int w[10], n,M=80;
	int p[10];
	int x[10] = { 0 };
	cin >> n;
	for (int i = 0; i < n; ++i)
	{
		cin >> w[i] >> p[i];
	}
	rucsac(M, n, w, p, x);
}
//4
//30 2
//10 1
//40 4
//20 3