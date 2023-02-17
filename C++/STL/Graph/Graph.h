#pragma once
/*
	Declaration of Graph class
*/

#include<iostream>
using namespace std;

struct Relation
{
	int entr_p;
	int ex_p;
	int weight;
};

class Graph
{
private:
	Relation *graph;
	int size;
public:
	Graph();
	~Graph();
	void addRib();
	void setRib();
	void showAdjacencyList();
	void findLoops();
};

