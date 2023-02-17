/*
	Implementation of class Queue
*/

#include "Queue.h"

Queue::Queue()
{
	capacity = 100;
	arr = new int[capacity];
}

Queue::Queue(int c)
{
	capacity = c;
	arr = new int[capacity];
}

Queue::Queue(const Queue &obj)
{
	capacity = obj.capacity;
	size = obj.size;
	arr = new int[capacity];
	for (size_t i = 0; i < size; i++)
	{
		arr[i] = obj.arr[i];
	}
}

Queue::Queue(Queue &&obj)
{
	swap(size, obj.size);
	swap(capacity, obj.capacity);
	swap(arr, obj.arr);
}

Queue::~Queue()
{
	if (capacity)
		delete[]arr;
}

Queue & Queue::operator=(const Queue &obj)
{
	if (this == &obj)
		return *this;
	if (size)
		delete[]arr;
	capacity = obj.capacity;
	size = obj.size;
	arr = new int[size];
	for (size_t i = 0; i < size; i++)
	{
		arr[i] = obj.arr[i];
	}
	return *this;
}

Queue & Queue::operator=(Queue &&obj)
{
	if (this == &obj)
		return *this;
	if (size)
		delete[]arr;
	arr = obj.arr;
	capacity = obj.capacity;
	size = obj.size;
	obj.arr = nullptr;
	obj.size = 0;
	return *this;
}

void Queue::push(int val)
{
	arr[size++] = val;
}

int Queue::pop()
{
	int tmp = arr[0];
	for (size_t i = 0; i < size - 1; i++)
	{
		arr[i] = arr[i + 1];
	}
	size--;
	return tmp;
}

int Queue::peek()
{
	return arr[0];
}

bool Queue::is_empty()
{
	return size == 0;
}

bool Queue::is_full()
{
	return size == capacity;
}
