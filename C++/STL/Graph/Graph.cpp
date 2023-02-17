#include "Graph.h"
/*
	Implementation of Graph class
*/


Graph::Graph()
{
	size = 0;
	graph = nullptr;
}


Graph::~Graph()
{
	size = 0;
	delete[]graph;
}

void Graph::addRib()
{
	if (size == 0)
	{
		graph = new Relation[1];
	}
	else
	{
		Relation *tmp = new Relation[size + 1];
		for (size_t i = 0; i < size; i++)
		{
			tmp[i] = graph[i];
		}
		delete[]graph;
		graph = tmp;
	}
	setRib();
	size++;
}

void Graph::setRib()
{
	cout << "Enter entrance point -> ";
	cin >> graph[size].entr_p;
	cout << "Enter exit point -> ";
	cin >> graph[size].ex_p;
	cout << "Enter weight -> ";
	cin >> graph[size].weight;
}

void Graph::showAdjacencyList()
{
	cout << "Entrance point\tExit point" << endl;
	for (size_t i = 0; i < size; i++)
	{
		cout << graph[i].entr_p << "\t\t" << graph[i].ex_p << endl;
	}
}

void Graph::findLoops()
{
	for (size_t i = 0; i < size; i++)
	{
		if (graph[i].entr_p == graph[i].ex_p)
			cout << "Loop: " << graph[i].entr_p << " -> " << graph[i].ex_p << endl;
	}
}