#include <stdio.h>
#include<assert.h>

void pedir_arreglo(int n_max, int a[]){
  printf("ingresar %d numeros: ", n_max);
  int i = 0;
  while(i < n_max){
    scanf("%d", &a[i]);
    i++;
  }
}

void intercambiar(int a[], int i, int j){
  int I;
  int J;
  I = a[i];
  J = a[j];

  a[i] = J;
  a[j] = I;
    
}

void imprimir_arreglo(int n_max, int a[]){
  int i = 0;
  while(i < n_max){
    if(i == 0){
      printf("[ %d , ", a[i]);
    } else if (i > 0 && i < n_max - 1){
      printf("%d , ", a[i]);
    } else {
      printf("%d ]\n", a[i]);
    }

    i++;
  }
}

int main(){
// n_max = 4
  int a[4];
  int i, j;
  pedir_arreglo(4, a);
  printf("valor de i: ");
  scanf("%d", &i);
  printf("valor de j: ");
  scanf("%d", &j);
  assert(i >= 0 && i < 4 && j >=0 && j < 4 && j != i);
  intercambiar(a, i, j);
  imprimir_arreglo(4, a);
  return 0;
}