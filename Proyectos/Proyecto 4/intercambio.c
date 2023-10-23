#include <stdio.h>
#include <assert.h>

int main() {
    int x, y, z;

    // Solicitar valores de entrada
    printf("Ingrese el valor de x: ");
    scanf("%d", &x);

    printf("Ingrese el valor de y: ");
    scanf("%d", &y);

    // Precondiciones: x e y son enteros
    assert(sizeof(x) == sizeof(int));
    assert(sizeof(y) == sizeof(int));

    // Intercambiar valores
    z = x;
    x = y;
    y = z;

    // Postcondiciones: x e y tienen valores intercambiados
    assert(x == y - z);
    assert(y == x - z);

    // Imprimir resultados
    printf("El valor intercambiado de x es: %d\n", x);
    printf("El valor intercambiado de y es: %d\n", y);

    return 0;
}
