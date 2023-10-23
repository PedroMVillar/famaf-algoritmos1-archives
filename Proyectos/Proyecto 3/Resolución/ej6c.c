#include <stdio.h>

int pedir_valor(char name) {
	int valor;

	printf("Ingrese el valor para %c: ", name);
	scanf("%d", &valor);
	return valor;
}

int cuatroB(int x, int y, int z, int m) {
  printf("σ0 (x->%d, y->%d, z->%d, m->%d)\n", x, y, z, m);
  if (x < y){
    m = x;
  } else {
    m = y;
  }
  printf("σ1 (x->%d, y->%d, z->%d, m->%d)\n", x, y, z, m);
  if (m<z){} else {
    m = z;
  }
  printf("σ2 (x->%d, y->%d, z->%d, m->%d)\n", x, y, z, m);
  
  return 0;
}

void imprimir_valores(char name, int valores) {
    printf("%c = %d\n", name, valores);
}

int main(void) {
	int x = pedir_valor('x');
	int y = pedir_valor('y');
	int z = pedir_valor('z');
	int m = pedir_valor('m');
    int output = cuatroB(x, y, z, m);
    imprimir_valores('m', output);
	return 0;
}

/* 
- La ventaja es ahorrar la repetición de scanf y printf.
- Se puede aplicar a los demas programas.
*/