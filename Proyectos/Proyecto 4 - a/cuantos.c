#include <stdio.h>

void pedir_arreglo(int n_max, int a[]){
  printf("ingresar %d numeros: ", n_max);
  int i = 0;
  while(i < n_max){
    scanf("%d", &a[i]);
    i++;
  }
}

 struct comp_t {
  int menores;
  int iguales;
  int mayores;
  };
  
struct comp_t cuantos(int tam, int a[], int elem){
 int i = 0;
struct comp_t res;
  res.menores = 0;
  res.iguales = 0; 
  res.mayores = 0;
  while(i < tam){
    if( a[i] < elem){
      res.menores++;
    } else if (a[i] == elem){
      res.iguales++;
    } else {
      res.mayores++;
    }
    i++;
  }
  return res;
}

int main(){
  int tam;
  struct comp_t res;
  int elem;
  printf("tamaño del arreglo: ");
  scanf("%d", &tam);
    int a[tam];
  pedir_arreglo(tam, a);
  printf("ingresar numero a comparar: ");
  scanf("%d", &elem);

 res = cuantos(tam, a, elem);
  printf("hay %d números menores a %d\n", res.menores, elem);
  printf("hay %d números iguales a %d\n", res.iguales, elem);
  printf("hay %d números mayores a %d", res.mayores, elem);
  return 0;
}