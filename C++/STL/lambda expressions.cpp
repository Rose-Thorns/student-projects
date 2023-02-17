/*
	Introductory lesson to lambda expressions 
	Contains the usage of algorithms, containers, and iterators.
*/

#include<iostream>
#include<string>
#include<vector>
#include<list>
#include<algorithm>
#include<iterator>
#include<ctime>
#include<random>
#include<functional>
#include<set>
#include<numeric>

using namespace std;

int rand_10_20()
{
	return rand() % 10 + 10;
}

class Numbers//Functor
{
	int n = 0;
public:
	Numbers( int val = 1 )
	{
		n = val;
	}
	int operator()()
	{
		return n++;
	}
};

bool compare( int a, int b )//Predicate
{
	return a > b;
}

int main()
{
	random_device rd;
	mt19937 gen( rd() );
	int min = 1, max = 10;
	auto f2 = [&] ( int min, int max )->function<int()> { // auto - function<function<int()>(int, int)>
		return [&, min, max] ()->int {
			uniform_int_distribution<int> uid( min, max );
			return uid(gen);
		};
	};
	srand( time( 0 ) );
	//LIST
	list<int>  l( 10 );
	ostream_iterator<int> osi( cout, " " );
	vector<int> v;
	generate( l.begin(), l.end(), Numbers() );
	copy( l.begin(), l.end(), osi );
	cout << endl;
	copy( l.rbegin(), l.rend(), osi );
	cout << endl;

	generate( l.begin(), l.end(), []()->int {
		return rand() % 20;
	} );
	copy( l.begin(), l.end(), back_inserter( v ) );
	copy( v.begin(), v.end(), osi );
	cout << endl;
	//RANDOM_SHUFFLE
	random_shuffle( v.begin(), v.end() );
	copy( v.begin(), v.end(), osi );
	cout << endl;
	//ACUMULATE
	int sum = accumulate( v.begin(), v.end(), 0 );
	cout << "Sum -> " << sum << endl;
	//SHUFFLE
	shuffle( v.begin(), v.end(), random_device() );
	copy( v.begin(), v.end(), osi );
	cout << endl;
	//COPY_IF
	vector<int> v2;
	copy_if( v.begin(), v.end(),back_inserter(v2), [] ( int val )->bool {
		return val % 2 == 0;
	} );
	cout << "EVEN VECTOR:" << endl;
	copy( v2.begin(), v2.end(), osi );
	cout << endl;
	//TRANSFORM
	transform( v.begin(), v.end(), v.begin(), [] ( int val )->int {
		return val * 2;
	} );
	copy( v.begin(), v.end(), osi );
	cout << endl;
	//TRANSFORM INT TO STRING
	vector<string> vs;
	transform( v.begin(), v.end(), back_inserter(vs), [] ( int val )->string {
		return to_string(val)+"!";
	} );
	cout << "vector" << endl;
	copy( vs.begin(), vs.end(), ostream_iterator<string>( cout, " " ));
	cout << endl;
	//SORT
	/*
	sort( v.begin(), v.end(), greater<>()); //#include<functional> ( default - less<>() )
	copy( v.begin(), v.end(), osi );
	cout << endl;

	sort( v.begin(), v.end(), compare );
	copy( v.begin(), v.end(), osi );
	cout << endl;
	*/
	set<int> s;
	copy( v.begin(), v.end(), inserter( s, s.begin() ) );
	copy( s.begin(), s.end(), osi );
	cout << endl;
	cout << endl;

	vector<int> _v;
	int n = 1;
	auto f1 = [] ( int min, int max )->function<int()> { // auto - function<function<int()>(int, int)>
		return [min, max] ()->int {
			return rand() % (max - min) + min;
		};
	};
	generate_n( back_inserter( _v ), 10, f1(min, max) );
	copy( _v.begin(), _v.end(), osi );
	cout << endl;

	generate_n( back_inserter( _v ), 10, [n] () mutable->int { //mutable - allows to change variable 
															   //[] - captures variable from outer scope - closure
		return n++;
	} );
	generate_n( back_inserter( _v ), 10, [&n] ()->int { //creates 
													    //captures variable by reference
		return n++;
	} );
	copy( _v.begin(), _v.end(), osi );
	cout << endl;

	function<int()> f = [] ()->int { 
		return rand()%20;
	};
	generate_n( back_inserter( _v ), 10, f );
	copy( _v.begin(), _v.end(), osi );
	cout << endl;

	auto it = find( _v.begin(), _v.end(), 19 );
	if ( it != _v.end() )
		cout << *it << " pos -> " << it - _v.begin() << endl;
	else
		cout << "Error. There is no such element" << endl;
	n = count( _v.begin(), _v.end(), 19 );
	cout << n << endl;
	n = count_if( _v.begin(), _v.end(), [] ( int val )->bool {
		return val % 2 == 0;
	} );
	cout << n << endl;
	/*for ( auto i = l.begin(); i != l.end(); ++i )
	{
		cout << *i << " ";
	}
	cout << endl;
	for ( auto i = l.rbegin(); i != l.rend(); ++i )
	{
		cout << *i << " ";
	}
	cout << endl;*/
}