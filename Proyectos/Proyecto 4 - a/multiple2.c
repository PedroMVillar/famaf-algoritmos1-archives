#include <stdio.h>
#include <assert.h>

//pedir entero 6a
int pedir_entero(char name){
  int x;
  printf("valor de %c: ", name);
  scanf("%d", &x);
  return x;
}

void asignacion(int x, int y, int z){
  int X,Y,Z;
  X = x;
  Y = y;
  Z = z;

  x = Y;
  y = X + Y + Z;
  z = Y + X;
  printf("x = %d, y = %d, z = %d", x, y, z);

}
int main(){
  int x,y,z;
  x = pedir_entero('x');
  y = pedir_entero('y');
  z = pedir_entero('z');
  asignacion(x,y,z);

  return 0;
}