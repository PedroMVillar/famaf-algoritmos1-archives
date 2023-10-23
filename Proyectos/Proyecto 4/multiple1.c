#include <assert.h>

int main() {
    int X;
    int Y;
    int x = X;
    int y = Y;
    
    assert(x == X && y == Y); // Precondition
    
    x = x + 1;
    y = x + y;
    
    assert(x == X + 1 && y == X + Y); // Postcondition
    
    return 0;
}
