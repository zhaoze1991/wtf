#include <iostream>
using namespace std;
int main(int argc, char const *argv[])
{
    int data1 = 10;
    int data2 = 20;
    int const *p1 = &data1; // a pointer point to a const int
    int *const p2 = &data2; // a const pointer point to int
    p1 = &data2;
    cout << *p1 << endl;
    return 0;
}
