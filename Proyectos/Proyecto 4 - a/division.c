#include <stdio.h>
#include<assert.h>

int pedir_entero(char name){
int x;
  printf("valor de %c: ", name);
  scanf("%d", &x);
  return x;
}

struct div_t {
    int cociente;
    int resto;
};

struct div_t division(int x, int y){
  assert(x >= 0 && y > 0);
  struct div_t resultado;
  resultado.cociente = x / y;
  resultado.resto = x % y;
  return resultado;
}

int main(){
  int x = pedir_entero('x');
  int y = pedir_entero('y');
  struct div_t resultado = division(x, y);
  printf("el cociente es: %d\n", resultado.cociente);
  printf("el resto es: %d", resultado.resto);
  return 0;
  
}