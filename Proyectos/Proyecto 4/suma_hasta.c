#include <stdio.h>
#include <assert.h>

int suma_hasta(int n);

// ------------------------------------------------------- //
// Implementación
int main(){
    int n, suma;
    printf("Ingrese el valor de n: ");
    scanf("%d", &n);
    suma = suma_hasta(n);
}
// ------------------------------------------------------- //

// ------------------------------------------------------- //
// Función de Suma
int suma_hasta(int n){
    assert(n > 0);
    int suma = 0;
    while(n > 0){
        suma = n + suma;
        n--;
    }
    printf("La suma es: %d", suma);
    return suma;
}
// ------------------------------------------------------- //
