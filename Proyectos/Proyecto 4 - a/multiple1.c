#include <stdio.h>
#include <assert.h>

//pedir entero 6a
int pedir_entero(char name){
  int x;
  printf("valor de %c: ", name);
  scanf("%d", &x);
  return x;
}

void asignacion(int x, int y){
  int X,Y;
  X = x;
  Y = y;

  x = X + 1;
  y = X + Y;
  printf("x = %d, y = %d", x, y);
  
}
int main(){
  int x,y;
  x = pedir_entero('x');
  y = pedir_entero('y');
  asignacion(x,y);
  
  return 0;
}