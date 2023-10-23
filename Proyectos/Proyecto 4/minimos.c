#include <stdio.h>
#include <limits.h>

int minimo_pares(int tam, int a[]);
int minimo_impares(int tam, int a[]);

int main() {
    int tam = 5;
    int a[tam];
    int i;

    // Pedir al usuario los elementos del arreglo
    printf("Ingrese %d elementos del arreglo:\n", tam);
    for (i = 0; i < tam; i++) {
        scanf("%d", &a[i]);
    }

    // Calcular el mínimo par y el mínimo impar
    int min_par = minimo_pares(tam, a);
    int min_impar = minimo_impares(tam, a);

    // Calcular el mínimo del arreglo
    int min = (min_par < min_impar) ? min_par : min_impar;

    // Mostrar resultados por pantalla
    printf("El mínimo par es: %d\n", min_par);
    printf("El mínimo impar es: %d\n", min_impar);
    printf("El mínimo del arreglo es: %d\n", min);

    return 0;
}

int minimo_pares(int tam, int a[]) {
    int i;
    int min = INT_MAX; // Neutro de la operación mínimo

    for (i = 0; i < tam; i++) {
        if (a[i] % 2 == 0 && a[i] < min) {
            min = a[i];
        }
    }

    return min;
}

int minimo_impares(int tam, int a[]) {
    int i;
    int min = INT_MAX; // Neutro de la operación mínimo

    for (i = 0; i < tam; i++) {
        if (a[i] % 2 != 0 && a[i] < min) {
            min = a[i];
        }
    }

    return min;
}
