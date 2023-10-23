#include <stdio.h>

#define MAX_SIZE 100

int sumatoria(int tam, int a[]) {
    int suma = 0;
    for (int i = 0; i < tam; i++) {
        suma += a[i];
    }
    return suma;
}

int main() {
    int a[MAX_SIZE];
    int tam;

    printf("Ingrese el tamaño del arreglo (máximo %d): ", MAX_SIZE);
    scanf("%d", &tam);

    printf("Ingrese los elementos del arreglo:\n");
    for (int i = 0; i < tam; i++) {
        scanf("%d", &a[i]);
    }

    int resultado = sumatoria(tam, a);
    printf("La suma de los elementos del arreglo es: %d\n", resultado);

    return 0;
}
