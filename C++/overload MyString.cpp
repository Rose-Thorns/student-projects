/*
	Crete class MyString
	Add:
	-Default constructor
	-Constructor with int parameter
	-Constructor with char* parameter
	-Destructor
	-Copy constructor
	-Move constructor
	Overload operators:
	+ joins 2 strings together
	- deletes substring in the string
	==, >, < compares 2 strings together
	= makes copy of the string
*/

#define _CRT_SECURE_NO_WARNINGS
#include<iostream>
#include<cstring>
using namespace std;

class MyString
{
private:
	char *str;
	int capacity = 80;
public:
	MyString()
	{
		cout << "Default constructor" << endl;
		str = new char[capacity]{};
	}
	MyString(int c)
	{
		cout << "Constructor with int param" << endl;
		if (c > 0)
			capacity = c;
		str = new char[capacity] {};
	}
	MyString(const char *s)
	{
		cout << "Constructor with char* param" << endl;
		str = _strdup(s);
		capacity = strlen(str) + 1;
	}
	~MyString()
	{
		cout << "Destructor" << endl;
		if (capacity)
			delete[]str;
	}
	MyString(const MyString &obj)
	{
		cout << "Copy constructor" << endl;
		capacity = obj.capacity;
		str = new char [capacity];
		strcpy(str, obj.str);
	}
	MyString(MyString &&obj)
	{
		cout << "Move constructor" << endl;
		capacity = obj.capacity;
		str = obj.str;
		obj.str = nullptr;
		obj.capacity = 0;
	}
	void print()
	{
		cout << (str?str:"No string") << endl;
	}
	void input()
	{
		char buf[1000];
		cout << "Enter the line -> ";
		cin.getline(buf, 1000);
		if (strlen(buf + 1) > capacity)
		{
			delete[]str;
			str = _strdup(buf);
			capacity = strlen(str) + 1;
			return;
		}
		strcpy(str, buf);
	}
	int getSize() const
	{
		return strlen(str);
	}
	int getCapacity() const
	{
		return capacity;
	}
	const char * getStr() const
	{
		return str;
	}
	MyString operator+ (char c) const
	{
		MyString tmp(getSize() + 2);
		strcpy(tmp.str, str);
		tmp.str[getSize()] = c;
		return tmp;
	}
	/*friend MyString operator+ (char t, const MyString &obj)
	{
		MyString tmp(obj.getSize() + 2);
		tmp.str[0] = t;
		strcat(tmp.str, obj.str);
		return tmp;
	}*/
	MyString operator+ (const char *s)
	{
		MyString tmp(getSize() + strlen(s) + 1);
		strcpy(tmp.str, str);
		strcat(tmp.str, s);
		return tmp;
	}
	bool operator== (const MyString &obj)
	{
		return !strcmp(str, obj.str);
	}
	bool operator> (const MyString &obj)
	{
		return strcmp(str, obj.str) > 0;
	}
	bool operator< (const MyString &obj)
	{
		return strcmp(str, obj.str) < 0;
	}
	MyString & operator= (const MyString &obj)
	{
		if (this == &obj)
			return *this;
		delete[]str;
		capacity = obj.capacity;
		str = new char [capacity];
		strcpy(str, obj.str);
		return *this;
	}
	MyString & operator= (MyString &&obj)
	{
		if (this == &obj)
			return *this;
		delete[]str;
		capacity = obj.capacity;
		str = obj.str;
		obj.str = nullptr;
		return *this;
	}
	MyString operator- (const MyString &obj)
	{
		MyString tmp(this->capacity);
		char *pt = str;
		char *start = str;
		while ((pt = strstr(pt, obj.str)) == nullptr)
		{
			strncat(tmp.str, start, pt - start);
			start = pt = pt + strlen(obj.str);
		}
		strcat(tmp.str, start);
		return tmp;
	}
};

MyString operator+ (char t, const MyString &obj)
{
	char *tmp = new char[obj.getSize() + 2]{};
	tmp[0] = t;
	strcat(tmp, obj.getStr());
	MyString buf(tmp);
	delete[]tmp;
	return buf;
}

//MyString createString(const char *s)
//{
//	MyString tmp(s);
//	return tmp;
//}

int main()
{
	MyString a("Hello");
	a.print();
	(a + '!').print();
	(a + ", world!").print();
	('!' + a).print();
	//MyString b = createString("World");
	/*MyString b = move(a);
	b.print();*/
}