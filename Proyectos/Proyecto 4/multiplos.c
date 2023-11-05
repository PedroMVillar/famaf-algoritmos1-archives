#include <stdio.h>
#include <stdbool.h>

bool todos_pares(int tam, int a[]);
bool existe_multiplo(int m, int tam, int a[]);

// ------------------------------------------------------- //
// Implementación
int main() {
    int tam = 5; // asumiendo un tamaño constante de 5
    int a[tam];
    printf("Ingrese %d numeros enteros:\n", tam);
    int i = 0;
    while (i < tam) {
        scanf("%d", &a[i]);
        i++;
    }
    int opcion;
    printf("Elija una opcion:\n");
    printf("1. Verificar si todos los numeros son pares\n");
    printf("2. Verificar si existe un multiplo de un numero dado\n");
    scanf("%d", &opcion);
    if (opcion == 1) {
        if (todos_pares(tam, a)) {
            printf("Todos los numeros son pares\n");
        } else {
            printf("No todos los numeros son pares\n");
        }
    } else if (opcion == 2) {
        int m;
        printf("Ingrese un numero para verificar si existe un multiplo: ");
        scanf("%d", &m);
        if (existe_multiplo(m, tam, a)) {
            printf("Existe un multiplo de %d en el arreglo\n", m);
        } else {
            printf("No existe un multiplo de %d en el arreglo\n", m);
        }
    } else {
        printf("Opcion invalida\n");
    }
    return 0;
}
// ------------------------------------------------------- //

// ------------------------------------------------------- //
// Funcion que verifica si todos los numeros en un arreglo son pares //
bool todos_pares(int tam, int a[]) {
    int i = 0;
    while (i < tam) {
        if (a[i] % 2 != 0) {
            return false;
        }
        i++;
    }
    return true;
}
// ------------------------------------------------------- //

// ------------------------------------------------------- //
// Funcion que verifica si existe un multiplo de un numero dado en un arreglo //
bool existe_multiplo(int m, int tam, int a[]) {
    int i = 0;
    while (i < tam) {
        if (a[i] % m == 0) {
            return true;
        }
        i++;
    }
    return false;
}
// ------------------------------------------------------- //