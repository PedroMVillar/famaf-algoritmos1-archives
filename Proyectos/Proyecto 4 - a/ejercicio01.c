#include <stdio.h>
#include <assert.h>

void holahasta(int n){
assert(n > 0);
while(n != 0){
  printf("hola\n");
  n = n - 1;
}
}

int pedir_numero(char name){
  int x;
  printf("Ingrese un valor de %c: ", name);
  scanf("%d", &x);
  return x;
}

int main(){
  int x = pedir_numero('x');
  holahasta(x);
}

/*
Ingrese un valor de x: 7
hola
hola
hola
hola
hola
hola
hola
*/