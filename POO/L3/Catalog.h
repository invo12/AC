#pragma once
#include <iostream>
#include <stdlib.h>
#include <string.h>
using namespace std;

typedef struct _Student {
private:
	char *nume;
	int nota;
public:
	int getNota(void);			//ia nota studentului
	void setNota(int v);		//pune nota studentului
	char* getNume(void);		//ia numele studentului
	void setNume(char unNume[]);//pune numele studentului
	void elibMem(void);			//elivereaza zona ocupata de student in memorie
	void citire(void);		    //setam toate datele necesare
	void afisare(void);			//afisam nume,nota
}Student;

typedef int(*PFnComparare)(Student a, Student b);

typedef struct _Grupa {
	
	int nrStud;				//nr de studenti
	Student *tabStudenti;	//tablou cu toti studentii
	char* numeGrupa;		//denumirea grupei: 1208B, 1207A etc.
	void citire(void);		//numele grupei,nr studenti etc
	void afisare(void);		//numele grupei,nr studenti etc
	PFnComparare comparator;//pointer la fct de comparatie		
	void bSort(void);		//functia de sortare				
	void elibMem(void);		//dealocare
} Grupa;

typedef struct _Catalog {
	int nrGrupe;								//cate grupe avem
	Grupa *tabGrupe;							//ce grupe avem
	void setComparator(PFnComparare comparator);//setam criteriul de comparatie
	void citire(void);							//citim numarul de grupe, alocam dinamic tabloul, apoi apelam citirea pentru
	void afisare(void);							//afisam, pe rand, continutul fiecarei grupe.
	void sortare(void);							//sortam dupa un anumit criteriu
	void elibMemorie(void);						//dealocam
} Catalog;

//declaratii de functii "globale":
int comparNumeAlfabetic(Student a, Student b);
int comparNoteDescrescator(Student a, Student b);
int comparNumeDupaLungimeCrescator(Student a, Student b);