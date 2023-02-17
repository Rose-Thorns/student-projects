#include "Tree.h"

int main()
{
	Tree<int> tree;
	tree.insert(50);
	tree.insert(40);
	tree.insert(30);
	tree.insert(55);
	tree.insert(70);
	tree.insert(20);
	tree.insert(80);
	tree.print();
	cout << endl;
	tree.print(tree.find(40));
	cout << endl;
	Tree<int> t = move(tree);
	t.print();
	cout << endl;
	/*Tree<int> t = move(tree);
	t.print();
	cout << endl;
	tree = t;
	tree.print();
	cout << endl;
	t.del(t.getRoot());
	t.print();
	cout<<endl;*/
}