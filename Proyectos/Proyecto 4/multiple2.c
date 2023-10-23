#include <assert.h>

int main() {
    int X;
    int Y;
    int Z;
    int x = X;
    int y = Y;
    int z = Z;

    assert(x == X && y == Y && z == Z);

    x = y;
    y = z;
    z = x;
/*
    int temp1 = y;
    int temp2 = y + x + z;
    int temp3 = y + x;

    x = temp1;
    y = temp2;
    z = temp3;
*/
    assert(x == Y && y == Y + X + Z && z == Y + X);

    return 0;
}
