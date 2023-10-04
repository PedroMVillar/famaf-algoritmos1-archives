#include <stdio.h>

void unoA(void) {
    printf("unoA\n");
    int x;

    printf("Ingrese un valor para x: ");
    scanf("%d", &x);

    printf("σ0 (x→%d)\n", x);
    x = 5;
    printf("σ1 (x→%d)\n", x);
}

void unoB(void) {
    printf("\nunoB\n");
    int x, y;

    printf("Ingrese un valor para x: ");
    scanf("%d", &x);

    printf("Ingrese un valor para y: ");
    scanf("%d", &y);

    printf("σ0 (x→%d, y→%d)\n", x, y);
    x = x + y;
    printf("x = x + y = %d | σ1 (x→%d, y→%d)\n", x, x, y);
    y = y + y;
    printf("y = y + y = %d | σ2 (x→%d, y→%d)\n", y, x, y);
}

void unoC(void) {
    printf("\nunoC\n");
    int x, y;

    printf("Ingrese un valor para x: ");
    scanf("%d", &x);

    printf("Ingrese un valor para y: ");
    scanf("%d", &y);

    printf("σ0 (x→%d, y→%d)\n", x, y);
    y = y + y;
    printf("y = y + y = %d | σ1 (x→%d, y→%d)\n", y, x, y);
    x = x + y;
    printf("x = x + y = %d | σ2 (x→%d, y→%d)\n", x, x, y);
}

int main(void) {
    unoA();
    unoB();
    unoC();
  return 0;
}