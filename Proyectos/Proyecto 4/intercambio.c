#include <stdio.h>
#include <assert.h>

int pedir_entero(char name);
void imprimir_entero(char name, int x);
void asignar(int x, int y);

// ------------------------------------------------------- //
// Implementación
int main(){
    int x = pedir_entero('x');
    int y = pedir_entero('y');
    asignar(x, y);
    return 0;
}
// ------------------------------------------------------- //

// ------------------------------------------------------- //
// Función pedirEntero() del proyecto 3
int pedir_entero(char name){
  int x;
  printf("Ingrese el valor para la variable %c: ", name);
  scanf("%d", &x);
  return x;
}
//Función imprimirEntero() del proyecto 3
void imprimir_entero(char name, int x) {
  printf("La variable %c es %d\n", name, x);
}
// ------------------------------------------------------- //

// ------------------------------------------------------- //
// Función de Asignación
void asignar(int x, int y){
    int z;
    z = x;
    x = y;
    y = z;
    imprimir_entero('x', x);
    imprimir_entero('y', y);
}
// ------------------------------------------------------- //