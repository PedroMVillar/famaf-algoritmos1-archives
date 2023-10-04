#include <stdio.h>

int main() {
  int x;
  int y;
  int z; 

  printf("Ingrese el número x: ");
  scanf("%d", &x);
  printf("Ingrese el número y: ");
  scanf("%d", &y);
  printf("Ingrese el número z: ");
  scanf("%d", &z);

  printf("El resultado de x + y + 1 es: %d\n", x + y + 1);
  printf("El resultado de z * z + y * 45 - 15 * x es: %d\n", z * z + y * 45 - 15 * x);
  printf("El resultado de y - 2 == (x * 3 + 1) mod 5 es: %d\n", y - 2 == (x * 3 + 1) % 5);
  printf("El resultado de y / 2 * x es: %d\n", y / 2 * x);
  printf("El resultado de y < x * z es: %d\n", y < x * z);
  return 0;
}
