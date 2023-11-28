#include <stdio.h>

void pedir_arreglo(int n_max, int a[]){
  printf("ingresar %d numeros: ", n_max);
  int i = 0;
  while(i < n_max){
    scanf("%d", &a[i]);
    i++;
  }
}

int sumatoria(int tam, int a[]){
  int suma = 0 ;
  int i = 0;
  while(i < tam){
    suma = a[i] + suma;
    i = i + 1;
  }
  return suma;
}

int main(){
    int n_max = 5;
    int a[n_max];
    pedir_arreglo(n_max, a);
    int res = sumatoria(n_max, a);
    printf("la suma es: %d", res);
    return 0;
}