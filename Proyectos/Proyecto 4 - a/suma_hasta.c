#include <stdio.h>
#include <assert.h>

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
int main(){
  int n, suma;
  printf("valor de n: ");
  scanf("%d", &n);
  suma = suma_hasta(n);
  
}

/* ejemplo:
valor de n: 6
La suma es: 21
  */