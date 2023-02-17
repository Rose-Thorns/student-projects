/*
    Inheritance
    Implementation of class Point and derived class Point3D
*/

#include <iostream>
#include <string>

using namespace std;

class Point
{
protected:
    int x;
    int y;
public:
    Point(int x = 0, int y = 0):x(x),y(y){}

    int getX() const
    {
        return x;
    }

    void setX(int x)
    {
        Point::x = x;
    }

    int getY() const
    {
        return y;
    }

    void setY(int y)
    {
        Point::y = y;
    }
    void print()
    {
        cout<<"X = "<<x<<" Y = "<<y;
    }
};

class Point3D: public Point
{
    int z;
public:
    Point3D(int x, int y, int z):Point(x,y)
    {
        this->z = z;
    }

    int getZ() const
    {
        return z;
    }

    void setZ(int z)
    {
        Point3D::z = z;
    }
    void print()
    {
        Point::print();
        cout<<" Z = "<<z;
    }
};

int main()
{
    Point a(1,2);
    a.print();
    cout<<endl;
    Point3D b(12,23,34);
    b.Point::print();
    cout<<endl;

}