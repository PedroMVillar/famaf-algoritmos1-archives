#include <stdio.h>

void intercambiar(int tam, int a[], int i, int j);

int main() {
    int tam;
    printf("Ingrese el tamaño del arreglo: ");
    scanf("%d", &tam);

    int a[tam];
    printf("Ingrese los elementos del arreglo:\n");
    for (int i = 0; i < tam; i++) {
        scanf("%d", &a[i]);
    }

    int i, j;
    printf("Ingrese las posiciones a intercambiar (separadas por un espacio): ");
    scanf("%d %d", &i, &j);

    if (i < 0 || i >= tam || j < 0 || j >= tam) {
        printf("Posiciones fuera de rango.\n");
        return 1;
    }

    intercambiar(tam, a, i, j);

    printf("Arreglo modificado:\n");
    for (int i = 0; i < tam; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");

    return 0;
}

void intercambiar(int tam, int a[], int i, int j) {
    int temp = a[i];
    a[i] = a[j];
    a[j] = temp;
}
