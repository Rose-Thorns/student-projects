#include"Graph.h"

int main()
{
	int size;
	cout << "Enter quantity of ribs in the graph -> ";
	cin >> size;
	Graph graph;
	for (size_t i = 0; i < size; i++)
	{
		cout << "Enter info for " << i << "rib:" << endl;
		graph.addRib();
	}
	system("cls");
	graph.showAdjacencyList();
	graph.findLoops();
}