#include <stdio.h>

void pedir_arreglo(int n_max, int a[]);
void imprimir_arreglo(int n_max, int a[]);

int main() {
    int n_max = 10;
    int a[n_max];
    pedir_arreglo(n_max, a);
    imprimir_arreglo(n_max, a);
    return 0;
}

void pedir_arreglo(int n_max, int a[]) {
    printf("Ingrese %d numeros enteros:\n", n_max);
    for (int i = 0; i < n_max; i++) {
        scanf("%d", &a[i]);
    }
}

void imprimir_arreglo(int n_max, int a[]) {
    printf("El arreglo ingresado es:\n");
    for (int i = 0; i < n_max; i++) {
        printf("%d ", a[i]);
    }
}
