#include <iostream>
#include <queue>
using namespace std;

void quickSort(int *v, int s, int d);
int pivotare(int *v, int s, int d);
void mergeSort(int *v, int s,int d, int *temp);
void interclasare(int *v, int s, int d, int mij, int *temp);
void shellSort(int *v, int l);
void insertionSort(int *v, int l);
void afisare(int *v, int l);
void radixSort(int *v, int l);
int maxim(int *v, int l);
void aranjare(int *v, int l, int poz);
void aranjareCoada(int *v,int l,int poz);

int main()
{
	//12 7 5 18 9 1 3 20 4 2
	int *v = new int[10];
	int *temp = new int[10];
	for (int i = 0; i < 10; ++i)
	{
		cin >> v[i];
	}
	//insertionSort(v, 10);
	//shellSort(v, 10);
	//radixSort(v, 10);
	//mergeSort(v, 0, 9, temp);
	//quickSort(v, 0, 9);
	radixSort(v, 10);
	afisare(v, 10);
	delete[]v;
	delete[]temp;
	return 0;
}
void aranjare(int *v, int l, int poz)
{
	int i;
	int frecv[10] = { 0 };//frecv[i]-cate elemente au cifra de pe pozitia poz egala cu i
	int *sortat = new int[l];//vectorul in care sortam
	for (i = 0; i < l; ++i)
	{
		++frecv[(v[i] / poz) % 10];//imi pune valori in vectorul de frecvente 
	}
	for (i = 1; i < 10; ++i)
	{
		frecv[i] += frecv[i - 1];//calculez indicii si imi rezerv spatiu
	}
	for (i = l - 1; i >= 0; --i)
	{
		sortat[frecv[(v[i] / poz) % 10] - 1] = v[i];	//pun pe pozitia corespunzatoare valoarea
		--frecv[(v[i] / poz) % 10];						//scad pozitia
	}
	for (i = 0; i < l; ++i)
	{
		v[i] = sortat[i];								//copiez vectorul sortat dupa cifra poz in vectorul initial
	}
	delete[] sortat;
	
}
int maxim(int *v, int l)
{
	int max = v[0];
	for (int i = 1; i < l; ++i)
	{
		if (v[i] > max)
		{
			max = v[i];
		}
	}
	return max;
}
void insertionSort(int *v, int l)
{
	int i,temp,j;
	for (i = 1; i < l; ++i)
	{
		temp = v[i];
		j = i - 1;//indexul variabilei de dinainte
		while ((j >= 0) && (temp < v[j]))
		{
			v[j + 1] = v[j];
			--j;
		}
		v[j + 1] = temp;
	}
}
void afisare(int *v, int l)
{
	for (int i = 0; i < l; ++i)
	{
		cout << v[i] << " ";
	}
	cout << endl;
}
void shellSort(int *v, int l)
{
	//daca h este 1 , algoritmul este insertion sort
	int temp, i,j,h;
	h = l / 2;
	while (h != 0)
	{
		for (int i = h; i < l; ++i)
		{
			temp = v[i];
			j = i-h;
			while ((j >= 0) && (temp < v[j]))
			{
				v[j + h] = v[j];
				j = j - h;
			}
			v[j + h] = temp;
		}
		h = h / 2;
	}
}
void radixSort(int *v, int l)
{
	int max = maxim(v, l);//iau maximul din vector pentru a sti care e numarul maxim de cifre
	int poz = 1;//poz=1->unitati,poz=10->zeci,poz=100->sute...
	while (max != 0)//imi ia numarul de cifre a lui max
	{
		//aranjare(v, l, poz);
		aranjareCoada(v, l, poz);
		max = max / 10;//scad numarul de cifre cu una
		poz = poz * 10;//trec la urmatoarea pozitie(de la unitati la zeci, zeci la sute...)
	}
}
void aranjareCoada(int *v, int l, int poz)
{
	queue<int> a[10];
	int k = 0,i = 0;
	for (i = 0; i < l; ++i)
	{
		a[(v[i] / poz)%10].push(v[i]);
	}
	i = 0;
	while (k < 10)
	{
		if (a[k].empty())
		{
			++k;
			continue;
		}
		v[i] = a[k].front();
		a[k].pop();
		++i;
	}
}
void mergeSort(int *v, int s, int d, int *temp)
{
	if (s < d)
	{
		int mij = (s + d) / 2;
		mergeSort(v, s, mij, temp);
		mergeSort(v, mij + 1, d, temp);
		interclasare(v, s, d, mij, temp);
	}
}
void interclasare(int *v, int s, int d, int mij, int *temp)
{
	int i = s;//index pentru vectorul 1
	int j = mij + 1;//index pentru vectorul 2
	int k = 0;
	while (i <= mij && j<=d)
	{
		if (v[i] < v[j])
		{
			temp[k] = v[i];
			++i;
			++k;
		}
		else
		{
			temp[k] = v[j];
			++j;
			++k;
		}
	}
	while (i <= mij)
	{
		temp[k] = v[i];
		++i;
		++k;
	}
	while (j <= d)
	{
		temp[k] = v[j];
		++j;
		++k;
	}
	for (int i = 0; i < k; ++i)
	{
		v[s + i] = temp[i];
	}
}
void quickSort(int *v, int s, int d)
{
	if (s < d)
	{
		int indexPivot = pivotare(v, s, d);
		quickSort(v, s, indexPivot - 1);
		quickSort(v, indexPivot + 1, d);
;	}
}
int pivotare(int *v, int s, int d)
{
	int i = s + 1,j = d;
	int pivot = v[s];
	while (i <= j)
	{
		if (v[i] <= pivot)
		{
			i++;
		}
		if (v[j] >= pivot)
		{
			--j;
		}
		if (i < j)
		{
			if ((v[i] > pivot) && (v[j] < pivot))
			{
				int aux = v[i];
				v[i] = v[j];
				v[j] = aux;
				i++;
				j--;
			}
		}
	}
	v[s] = v[i - 1];
	v[i - 1] = pivot;
	return i - 1;
}