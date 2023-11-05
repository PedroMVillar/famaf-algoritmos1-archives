#include <stdio.h>
#define n_max 5

void pedir_arreglo(int a[]);
int sumatoria(int tam, int a[]);

// ------------------------------------------------------- //
int main(){
    int a[n_max];
    pedir_arreglo(a);
    int res = sumatoria(n_max, a);
    printf("la suma es: %d", res);
    return 0;
}
// ------------------------------------------------------- //

// ------------------------------------------------------- //
// Funcion pedir_arreglo
void pedir_arreglo(int a[]){
  printf("ingresar %d numeros: ", n_max);
  int i = 0;
  while(i < n_max){
    scanf("%d", &a[i]);
    i++;
  }
}
// ------------------------------------------------------- //

// ------------------------------------------------------- //
// Funcion sumatoria
int sumatoria(int tam, int a[]){
  int suma = 0 ;
  int i = 0;
  while(i < tam){
    suma = a[i] + suma;
    i = i + 1;
  }
  return suma;
}
// ------------------------------------------------------- //