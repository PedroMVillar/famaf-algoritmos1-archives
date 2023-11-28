#include <stdio.h>
#include <stdbool.h>

void pedir_arreglo(int n_max, int a[]){
  printf("ingresar %d numeros: ", n_max);
  int i = 0;
  while(i < n_max){
    scanf("%d", &a[i]);
    i++;
  }
}

bool todos_pares(int tam, int a[]){
  int i = 0;
  while(i < tam){
    if(a[i] % 2 == 0){
    } else {
      return false;
    }
    i++;
  }
  return true;
}

bool existe_multiplo(int m, int tam, int a[]){

  int i = 0;
  while(i < tam){
    if (a[i] % m == 0){
      return true;
    } else {
 }
    i++;
  }
  return false;
  
}

int main(){
    int tam = 4;
    int a[tam];
    int m;
    pedir_arreglo(4, a);
    todos_pares(4, a);
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