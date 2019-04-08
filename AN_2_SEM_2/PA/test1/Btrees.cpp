#include<iostream>
using namespace std;

static int f = 3;
enum class TipNod
{
	frunza,
	interior
};
struct Nod
{
	int* keys;		//cheile din nod
	Nod** c;		//copiii unui nod
	int n;			//nr de chei
	TipNod tipNod;	//tipul nodului
};

void creaazaArbore(Nod* &r);
void spargereNod(int i, Nod*& fiu, Nod*& parinte);
void Afisare(Nod* r);
Nod* cautare(Nod* r, int k);
void insert(Nod*& v, int k);
void inserareNodIncomplet(Nod* &v, int k);

int main()
{
	Nod* rad = nullptr;
	creaazaArbore(rad);
	for(int i = 0;i < 100;++i)
		insert(rad, i);
	Afisare(rad);
}

void creaazaArbore(Nod* &r)
{
	r = new Nod;				//cream un nod nou 
	r->tipNod = TipNod::frunza;	//nu avem niciun nod in arbore deci e frunza
	r->keys = new int[2 * f - 1];//alocam spatiu maxim pt nr de chei
	r->c = new Nod*[2 * f];		//alocam spatiu maxim nr fii
	r->n = 0;					//nu avem nicio cheie in arbore deci nr lor e 0
}


void Afisare(Nod* r)
{
	int i;
	//un nod are n+1 fii
	for (i = 0; i < r->n; ++i)				//traversam mai intai primii n fii
	{
		if (r->tipNod == TipNod::interior)	//daca e nod interior afisam si subarborii copii
		{
			Afisare(r->c[i]);
		}
		cout << r->keys[i] << ' ';			//afisarea valorii
	}

	if (r->tipNod == TipNod::interior)		//traversam si ultimul subarbore,al n+1-lea fiu
		Afisare(r->c[r->n]);
}

Nod* cautare(Nod* r, int k)
{
	int i = 0;
	while (i < r->n && k > r->keys[i])	//comparam valoarea cu toate cheile din nod pentru a vedea pe care fiu ne ducem 
		i++;
	if (r->keys[i] == k)				//daca am gasit valoarea,atunci returnam nodul in care am gasit
		return r;
	if (r->tipNod == TipNod::frunza)	//daca suntem pr frunza,am comparat cu toate din nod si am concluzionat ca nu am gasit valoarea,atunci ea nu exista in arbore
		return nullptr;

	return cautare(r->c[i],k);			//daca suntem pe un nod intern si nu am gasit valoarea,ne ducem pe fii corespunzatori
}

void insert(Nod*& v, int k)
{
	if (v->n == 2 * f - 1)
	{
		Nod* u;
		creaazaArbore(u);
		u->tipNod = TipNod::interior;
		u->c[0] = v;
		spargereNod(0, v, u);
		inserareNodIncomplet(u, k);
		v = u;
	}
	else
		inserareNodIncomplet(v, k);
}

void inserareNodIncomplet(Nod* &v, int k)
{
	int i = v->n - 1;
	if (v->tipNod == TipNod::frunza)		//daca e frunza
	{
		while (i >= 0 && v->keys[i] > k)	//cauta pozitia,de la dreapta la stanga,in care sa inserezi
		{
			v->keys[i + 1] = v->keys[i];	//si shifteaza la dreapta valorile pana gasesti
			i--;
		}

		v->keys[i + 1] = k;					//pune nodul pe pozitia potrivita
		v->n = v->n + 1;					//creste numarul de chei din nod
	}
	else									//daca e intern
	{								
		while (i >= 0 && v->keys[i] > k)	//cauta fiul pe care sa te duci
			i--;
		i++;
		if (v->c[i]->n == 2 * f - 1)	//daca e full
		{
			spargereNod(i, v->c[i],v);//sparge-l

			if (v->keys[i] < k)			//si daca k e mai mare decat cea mai mare cheie din nod
				i++;						//mergi pe ultimul fiu
		}
		inserareNodIncomplet(v->c[i], k);	//insereaza in subarborele corespunzator
	}
}

void spargereNod(int i, Nod*& v, Nod*& u)
{
	Nod* w;
	creaazaArbore(w);
	w->tipNod = v->tipNod;
	w->n = f - 1;
	for (int j = 0; j < f - 1; ++j)
	{
		w->keys[j] = v->keys[j + f];
	}
	if (v->tipNod == TipNod::interior)
	{
		for (int j = 0; j < f; ++j)
		{
			w->c[j] = v->c[j + f];
		}
	}
	v->n = f - 1;
	for (int j = u->n; j >= i + 1; --j)
	{
		u->c[j + 1] = u->c[j];
	}
	u->c[i + 1] = w;
	for (int j = u->n - 1; j >= i; --j)
	{
		u->keys[j + 1] = u->keys[j];
	}
	u->keys[i] = v->keys[f - 1];
	u->n = u->n + 1;
}