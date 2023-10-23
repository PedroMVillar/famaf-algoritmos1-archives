#include <stdio.h>

// Función que calcula la suma de los primeros n números naturales
int suma_hasta(int n) {
    int suma = (n * (n + 1)) / 2; // Fórmula de Gauss
    return suma;
}

int main() {
    int n;
    printf("Ingrese un número entero: ");
    scanf("%d", &n);
    if (n < 0) {
        printf("Error: el número debe ser no negativo.\n");
    } else {
        int resultado = suma_hasta(n);
        printf("La suma de los primeros %d números naturales es: %d\n", n, resultado);
    }
    return 0;
}
