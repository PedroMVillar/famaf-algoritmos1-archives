#include <stdio.h>

struct comp_t {
    int menores;
    int iguales;
    int mayores;
};

struct comp_t cuantos(int tam, int a[], int elem) {
    struct comp_t result = {0, 0, 0}; // Inicializamos los contadores en 0
    for (int i = 0; i < tam; i++) {
        if (a[i] < elem) {
            result.menores++;
        } else if (a[i] == elem) {
            result.iguales++;
        } else {
            result.mayores++;
        }
    }
    return result;
}

int main() {
    int a[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int tam = sizeof(a) / sizeof(a[0]);
    int elem = 5;
    struct comp_t result = cuantos(tam, a, elem);
    printf("Menores: %d\nIguales: %d\nMayores: %d\n", result.menores, result.iguales, result.mayores);
    return 0;
}
