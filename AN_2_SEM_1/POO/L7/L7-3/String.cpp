#include "String.h"
#pragma region Constructori/Deconstructori
String::String()
{
	size = 0;
	sir = nullptr;
}

String::String(char* s)
{
	size = strlen(s);
	sir = new char[size + 1];
	strcpy_s(sir, size + 1, s);
}

String::String(const String& a)
{
	sir = new char[a.size + 1];
	strcpy_s(sir, a.size + 1, a.sir);
	size = a.size;
}

String::~String()
{
	if (sir != nullptr)
	{
		delete sir;
		sir = nullptr;
	}
}
#pragma endregion

#pragma region Operatori

String String::operator+(const String &a)
{
	String temp;
	temp.sir = new char[a.size + this->size + 1];
	for (int i = 0; i < a.size; ++i)
	{
		temp.sir[i] = a.sir[i];
	}
	for (int i = 0; i < this->size; ++i)
	{
		temp.sir[a.size + i] = this->sir[i];
	}
	temp.size = a.size + this->size;
	temp.sir[temp.size] = '\0';
	return temp;
}

String& String::operator=(const String &a)
{
	if (sir != nullptr)
	{
		delete[] sir;
		sir = nullptr;
	}
	sir = new char[a.size + 1];
	strcpy_s(sir, a.size + 1, a.sir);
	size = a.size;
	return *this;

}

bool String::operator==(const String &a)
{
	if (a.size == size)
	{
		return (strcmp(a.sir, sir) == 0) ? true : false
;
	}
	return false;
}
#pragma endregion

#pragma region Others

int String::cauta(String subsir)
{
	int index = -1;
	for (int i = 0; i < size; ++i)
	{
		if (sir[i] == subsir.sir[0])
		{
			index = i;
			for (int j = 1; j < subsir.size; ++j)
			{
				if (i + j >= size)
				{
					return -1;
				}
				if (sir[i + j] == subsir.sir[j])
				{
					continue;
				}
				else
				{
					index = -1;
					break;
				}
			}
			if (index != -1)
				return index;
		}
	}
}

void String::afisare()
{
	if (sir == nullptr)
		return;
	for (int i = 0; i < size; ++i)
	{
		cout << sir[i];
	}
	cout << endl;
}

int String::compara(String sir2)
{
	return strcmp(sir, sir2.sir);
}
#pragma endregion
