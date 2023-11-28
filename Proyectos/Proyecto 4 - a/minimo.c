#include <stdio.h>
#include <assert.h>

int minimo(int x, int y);

int main() {
    int x, y;
    printf("Ingrese dos numeros enteros: ");
    scanf("%d %d", &x, &y);
    int resultado = minimo(x, y);
    printf("El minimo entre %d y %d es %d\n", x, y, resultado);

    assert(resultado == (x < y ? x : y));
    return 0;
}

int minimo(int x, int y) {

    int min;
    if (x < y) {
        min = x;
    } else {
        min = y;
    }
    return min;
}