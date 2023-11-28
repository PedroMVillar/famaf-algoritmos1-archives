#include <stdio.h>
#include <limits.h>

void pedir_arreglo(int n_max, float a[]){
  printf("ingresar %d numeros: ", n_max);
  int i = 0;
  while(i < n_max){
    scanf("%f", &a[i]);
    i++;
  }
}

struct datos_t {
float maximo;
float minimo;
float promedio;
};

struct datos_t stats(int tam, float a[]){
  int i = 0;
  struct datos_t res;
  int suma = 0;
  res.maximo = INT_MIN;
  res.minimo = INT_MAX;
  while(i < tam){
      if(a[i] < res.minimo){
        res.minimo = a[i];
      } else if (a[i] > res.maximo){
        res.maximo = a[i];
      }
    suma = a[i] + suma;
    i++;
    }
res.promedio = suma / tam;
  return res;
}

int main(){
  int tam;
  struct datos_t res;
  printf("cantidad de elementos del arreglo: ");
  scanf("%d", &tam);
  float a[tam];
  pedir_arreglo(tam, a);

  res = stats(tam, a);
  printf("el maximo del arreglo es %f\n", res.maximo);
  printf("el minimo del arreglo es %f\n", res.minimo);
  printf("el promedio del arreglo es %f", res.promedio);
  return 0;
}