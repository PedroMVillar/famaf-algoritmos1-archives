#include <stdio.h>
#include <limits.h>

void pedir_arreglo(int n_max, int a[]){
  printf("ingresar %d numeros: ", n_max);
  int i = 0;
  while(i < n_max){
    scanf("%d", &a[i]);
    i++;
  }
}


int minimo_pares(int tam, int a[]){
int min = INT_MAX;
int i = 0;
  while(i < tam){
    if(a[i] % 2 == 0 && a[i] < min){
      min = a[i];
    } 
    i++;
  }
  return min;
}


int minimo_impares(int tam, int a[]){
  int i = 0;
  int min = INT_MAX;
  while(i < tam){
      if(a[i] % 2 != 0 && a[i] < min){
        min = a[i];
      } 
    i++;
    }
  return min;
}

int main(){
int n_max;
int minimo_par;
  int minimo_impar;
  
  printf("cantidad de elementos en el arreglo: ");
  scanf("%d", &n_max);
  int a[n_max];
  pedir_arreglo(n_max, a);
  
  minimo_par = minimo_pares(n_max, a);
  minimo_impar = minimo_impares(n_max, a);
  printf("el minimo par es %d, el minimo impar es %d", minimo_par, minimo_impar);
  
  return 0;
}