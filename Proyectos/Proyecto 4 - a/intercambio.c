//Traducir en intercambio.c el siguiente programa que
//intercambia los valores de dos variables x e y de tipo Int.

#include <stdio.h>
#include <assert.h>

void main(){
int x, y,z;
  printf("valor de x:");
  scanf("%d", &x);
  printf("valor de y:");
  scanf("%d", &y);

  z = x;
  x = y;
  y = z;

  printf("valor' de x: %d\n", x);
  printf("valor' de y: %d", y);
}