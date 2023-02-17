#pragma once
/*
	Declaration of class Stack
*/

#include<iostream>
using namespace std;

class Stack
{
private:
	int *arr = nullptr;
	int top = -1;
	int capacity = 0;
public:
	Stack();
	Stack(int);
	Stack(const Stack &);
	Stack(Stack &&);
	~Stack();
	Stack &operator= (const Stack &);
	Stack &operator= (Stack &&);
	void push(int);
	int pop();
	int peek();
	bool is_empty();
	bool is_full();
};

