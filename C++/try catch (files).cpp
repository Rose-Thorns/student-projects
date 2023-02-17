/*
	try-catch exceptions while performing operations on files
*/

#include<iostream>
#include<fstream>
#include<string>
using namespace std;

class myArray
{
	int size;
	double *arr = nullptr;
public:
	myArray() = default;
	myArray( int s, double val )
	{
		size = s;
		arr = new double[size];
		for ( size_t i = 0; i < size; i++ )
		{
			arr[i] = val;
		}
	}
	~myArray()
	{
		if ( size )
			delete[]arr;
	}
	int getSize()
	{
		return size;
	}
	double &operator[]( int pos )
	{
		return arr[pos];
	}
	void save( fstream &fs )
	{
		fs.write( (char *) &size, sizeof( int ) );
		fs.write( (char*) arr, sizeof( double )*size );
	}
	void load( fstream &fs )
	{
		if ( size )
			delete[]arr;
		fs.read( (char*) &size, sizeof( int ) );
		arr = new double[size];
		fs.read( (char*) arr, sizeof( double )*size );
	}
};

int main()
{
	fstream fs;
	string str;

	myArray obj( 10, 34.6 );
	myArray to_read;

	try
	{
		fs.open( "my_array.bin", ios::in | ios::binary );
		if ( !fs.is_open() )
			throw new logic_error( "Can not open the file" );
		to_read.load(fs);
		for ( size_t i = 0; i < to_read.getSize(); i++ )
		{
			cout << to_read[i] << " ";
		}
		cout << endl;
		fs.close();
	}
	catch ( const logic_error &ex )
	{
		cerr << "Error. " << ex.what() << endl;
	}

	/*try
	{
		fs.open( "my_array.bin", ios::out | ios::binary );
		if ( !fs.is_open() )
			throw new logic_error( "Can not open the file" );
		fs.write( (char *) &obj, sizeof( obj ) );
		fs.close();
	}
	catch ( const logic_error &ex )
	{
		cerr << "Error. " << ex.what() << endl;
	}*/

	//double arr[5]{ 1.2,2.3,3.4,4.5,5.6 }, mas[5]{};
	
	//fs.open(R"()", ios::out); //raw string
	/*try 
	{
		fs.open( "test.txt", ios::out ); //ios::in|ios::ate|ios::app|ios::trunc|ios::binary
		if ( !fs.is_open() ) //fs.good(), fs.bad(), fs.isopen()
			throw new logic_error( "Can not open the file" );
		fs << "Some text" << endl;
		fs << "One more line of text" << endl;
		fs.close();
	}
	catch ( const logic_error &ex )
	{
		cout << "Error. " << ex.what() << endl;
	}*/

	/*try
	{
		fs.open( "test.txt", ios::in );
		if ( !fs.is_open() ) 
			throw new logic_error( "Can not open the file" );
		fs >> str;
		cout << fs.rdbuf() << endl;
		while ( fs.eof() )
		{
			getline( fs, str );
			cout << str << endl;
		}
		fs.close();
	}
	catch ( const logic_error &ex )
	{
		cerr << "Error. " << ex.what() << endl;
	}*/

	/*try
	{
		fs.open( "test.bin", ios::out|ios::binary );
		if ( !fs.is_open() )
			throw new logic_error( "Can not open the file" );
		fs.write( (char *) arr, sizeof( double ) * 5 );
		fs.close();
	}
	catch ( const logic_error &ex )
	{
		cerr << "Error. " << ex.what() << endl;
	}*/

	/*try
	{
		fs.open( "test.bin", ios::out | ios::binary );
		if ( !fs.is_open() )
			throw new logic_error( "Can not open the file" );
		fs.read( (char *) mas, sizeof( double ) * 5 );
		for ( size_t i = 0; i < 5; i++ )
		{
			cout << mas[i] << " ";
		}
		cout << endl;
		fs.close();
		system( "pause" );
	}
	catch ( const logic_error &ex )
	{
		cerr << "Error. " << ex.what() << endl;
	}*/
}
