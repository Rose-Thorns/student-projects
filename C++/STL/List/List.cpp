/*
	Implementation of classes Node and List
*/

#include "List.h"

Node::Node()
{
	next = prev = nullptr;
}
Node::Node(int val)
{
	data = val;
	next = prev = nullptr;
}
int Node::getData()const
{
	return data;
}
void Node::setData(int d)
{
	data = d;
}
Node *Node::getNext()const
{
	return next;
}
void Node::setNext(Node *n)
{
	next = n;
}
Node *Node::getPrev()const
{
	return prev;
}
void Node::setPrev(Node *p)
{
	prev = p;
}

List::List()
{
	size = 0;
	head = tail = nullptr;
}
List::List(const List&obj) :List()
{
	Node*cur = obj.head;
	while (cur)
	{
		push_back(cur->getData());
		cur = cur->getNext();
	}
}
List::List(List&&obj)
{
	size = obj.size;
	head = obj.head;
	tail = obj.tail;
	obj.size = 0;
	obj.head = obj.tail = nullptr;
}
List::~List()
{
	while (size)
	{
		pop_front();
	}
}
void List::push_back(int data)
{
	Node*tmp = new Node(data);
	if (size == 0)
	{
		head = tail = tmp;
	}
	else
	{
		tmp->setPrev(tail);
		tail->setNext(tmp);
		tail = tmp;
	}
	size++;
}
void List::pop_front()
{
	if (size == 0)
		return;
	if (size == 1)
	{
		delete head;
		head = tail = nullptr;
		size = 0;
		return;
	}
	Node*tmp = head;
	head = head->getNext();
	head->setPrev(nullptr);
	delete tmp;
	size--;
}
//void List::insert(int pos, int val)
//{
//	if (pos <= 0 && !(this->Head)) {
//		Add(data); ++(this->Count); return;
//	}
//	Element * tf = this->Head;
//	for (int i = 1; i < pos && tf->Next; ++i)
//		tf = tf->Next;
//	Element * temp = new Element;
//	temp->data = data;
//	temp->Next = tf->Next;
//	tf->Next = temp;
//	++(this->Count);
//}
void List::print_list()
{
	Node*cur = head;
	while (cur)
	{
		cout << cur->getData() << " ";
		cur = cur->getNext();
	}
	cout << endl;
}
List &List::operator=(const List&obj)
{
	if (this == &obj)
		return *this;
	while (size)
	{
		pop_front();
	}
	Node*cur = obj.head;
	while (cur)
	{
		push_back(cur->getData());
		cur = cur->getNext();
	}
	return *this;
}
List &List::operator=(List&&obj)
{
	if (this == &obj)
		return *this;
	while (size)
	{
		pop_front();
	}
	size = obj.size;
	head = obj.head;
	tail = obj.tail;
	obj.size = 0;
	obj.head = obj.tail = nullptr;
	return *this;
}