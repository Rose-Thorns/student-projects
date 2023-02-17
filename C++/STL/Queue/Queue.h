#pragma once
/*
	Declaration of class Queue
*/

#include<iostream>
using namespace std;

class Queue
{
private:
	int *arr = nullptr;
	int size = 0;
	int capacity = 0;
public:
	Queue();
	Queue(int);
	Queue(const Queue &);
	Queue(Queue &&);
	~Queue();
	Queue &operator= (const Queue &);
	Queue &operator= (Queue &&);
	void push(int);
	int pop();
	int peek();
	bool is_empty();
	bool is_full();
};

