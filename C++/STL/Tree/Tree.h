#pragma once
/*
	Declaration and implementation of class Tree
*/

#include "Node.h"
template <class T>
class Tree
{
    Node<T>*root=nullptr;
public:
    Tree()= default;
	~Tree();
    void insert(T);
    void del(Node<T>*);
	Node <T>*find(T val);
	void print();
    void print(Node<T>*);
    void copy(Node<T>*);
	Tree(const Tree &obj);
	Tree(Tree &&obj);
	Tree<T> & operator = (const Tree<T> &obj);
	Tree<T> & operator = (Tree<T> &&obj);
    Node<T>* getRoot();
    Node<T>* getMin(Node<T>*);
    Node<T>* getNext(Node<T>*);
};

template<class T>
Tree<T>::~Tree()
{
	if (root != nullptr)
		delete root;
}

template <class T>
void Tree<T>::insert(T val)
{
	Node<T>* node = new Node<T>(val);
	if (root == nullptr)
	{
		root = node;
		return;
	}
	Node<T>* cur = root;
	Node<T>* prev = root;
	while (cur)
	{
		prev = cur;
		if (val < cur->getData())
			cur = cur->getLeft();
		else
			cur = cur->getRight();
	}
	node->setParent(prev);
	if (val < prev->getData())
		prev->setLeft(node);
	else
		prev->setRight(node);
}

template<class T>
void Tree<T>::del(Node<T> *node)
{
    if(node==nullptr)
        return;
    Node<T>*target, *son;

    if(node->getRight()&&node->getLeft())
        target = getNext(node);
    else
        target = node;

    if(target->getLeft())
        son = target->getLeft();
    else
        son = target->getRight();

    if(son)
        son->setParent(target->getParent());

    if(target->getParent()== nullptr)
        root = son;
    else
    {
        if(target==target->getParent()->getLeft() )
            target->getParent()->setLeft(son);
        else
            target->getParent()->setRight(son);
    }
    if(node!=target)
        node->setData(target->getData());

    delete target;
}

template<class T>
Node <T>* Tree<T>::find(T val)
{
	Node <T>*cur = root;
	while (cur)
	{
		if (cur->getData() == val)
			return cur;
		if (val < cur->getData())
			cur = cur->getLeft();
		else
			cur = cur->getRight();

	}
	return cur;
}

template <class T>
void Tree<T>::print()
{
    print(root);
}

template <class T>
void Tree<T>::print(Node<T>*node)
{
    if(node== nullptr)
        return;

    print(node->getLeft());
    std::cout<<node->getData()<<" ";
    print(node->getRight());

}

template <class T>
void Tree<T>::copy(Node<T>*node)
{
	if (node == nullptr)
		return;
	insert(node->getData());
	copy(node->getLeft());
	copy(node->getRight());

}

template <class T>
Tree<T>::Tree(const Tree &obj)
{
	copy(obj.root);
}

template <class T>
Tree<T>::Tree(Tree &&obj)
{
	if (obj.root == nullptr)
		return;
	root = obj.root;
	obj.root = nullptr;
}

template <class T>
Tree<T> & Tree<T>::operator= (const Tree &obj)
{
	copy(obj.root);
	return *this;
}

template <class T>
Tree<T> & Tree<T>::operator= (Tree &&obj)
{
	if (this == &obj)
		return *this;
	delete root;
	root = new Node<T>;
	*root = *obj.root;
	return *this;
}

template<class T>
Node<T> *Tree<T>::getNext(Node<T> * node)
{
	if (node == nullptr)
		return nullptr;
	if (node->getRight())
		return getMin(node->getRight());
	Node<T>* tmp = node->getParent();
	while (tmp && node == tmp->getRight())
	{
		node = tmp;
		tmp = node->getParent();
	}
	return tmp;
}

template <class T>
Node<T>*Tree<T>::getMin(Node<T>*node)
{
	if (node == nullptr)
		return nullptr;
	while (node->getLeft())
	{
		node = node->getLeft();
	}
	return node;
}

template <class T>
Node<T>*Tree<T>::getRoot()
{
	return root;
}

