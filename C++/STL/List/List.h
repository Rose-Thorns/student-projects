/*
	Declaration of classes Node and List
*/

#pragma once
#include <iostream>
#include <string>
using namespace std;

class Node
{
	int data;
	Node *next;
	Node *prev;
public:
	Node();
	Node(int val);
	int getData()const;
	void setData(int data);
	Node *getNext()const;
	void setNext(Node*next);
	Node *getPrev()const;
	void setPrev(Node*prev);
};

class List
{
	int size;
	Node *head;
	Node *tail;
public:
	List();
	List(const List &obj);
	List(List &&obj);
	~List();
	void push_back(int data);
	void pop_front();
	void insert(int pos, int val);
	void print_list();
	List &operator=(const List&obj);
	List &operator=(List&&obj);
};

