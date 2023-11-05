#include <stdio.h>

void pedir_arreglo(int tam, int a[]);
void imprimir_arreglo(int tam, int a[]);
int print_iguales(int tam, int a[]);

// ------------------------------------------------------- //
// Implementación
int main(){
    int tam =5;
    int a[tam];
    pedir_arreglo(tam, a);
    imprimir_arreglo(tam, a);
    printf("\n");
    printf("La cantidad de elementos iguales consecutivos es: %d", print_iguales(tam, a));
    return 0;
}
// ------------------------------------------------------- //

// ------------------------------------------------------- //
// Funcion que pide un arreglo de enteros de tamaño n_max //
void pedir_arreglo(int tam, int a[]){
    int i= 0;
    while (i<tam){
        printf("Ingrese el valor %d: ", i+1);
        scanf("%d", &a[i]);
        i++;
    }
}
// ------------------------------------------------------- //

// ------------------------------------------------------- //
// Funcion que imprime un arreglo de enteros de tamaño n_max //
void imprimir_arreglo(int tam, int a[]){
    int i= 0;
    while (i<tam){
        printf("%d ", a[i]);
        i++;
    }
}
// ------------------------------------------------------- //

// ------------------------------------------------------- //
// Funcion que retorna la cantidad de elementos iguales consecutivos en un arreglo //
int print_iguales(int tam, int a[]){
    int i = 0;
    int res = 1;
    while (i<tam){
        if (a[i] != a[i+1]){    
        } else {
            res++;
        }
        i++;
    }
    return res;    
}
// ------------------------------------------------------- //