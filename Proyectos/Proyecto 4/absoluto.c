#include <stdio.h>
#include <assert.h>

int abs(int x);

// ------------------------------------------------------- //
// Implementación
int main(){
  int x;
  printf("Ingrese un valor para x:");
  scanf("%d", &x);
  printf("el val absol es: %d", abs(x));
  return 0;
}
// ------------------------------------------------------- //

// ------------------------------------------------------- //
// Función de valor absoluto
int abs(int x){
  if(x<0){
    return -x;
  }
  return x;
}
// ------------------------------------------------------- //
