#include <stdio.h>

void unoE(void) {
    printf("EJ unoE\n");
    int x, y;

    printf("Ingrese un valor para x: ");
    scanf("%d", &x);

    printf("Ingrese un valor para y: ");
    scanf("%d", &y);

    printf("σ0 (x→%d, y→%d)\n", x, y);

    if (x >= y) {
        printf("x >= y\n");
        printf("  σ1 (x→%d, y→%d)\n", x, y);
        x = 0;
        printf("  σ2 (x→%d, y→%d)\n", x, y);
    }

    if (x <= y) {
        printf("x <= y\n");
        printf("  σ1 (x→%d, y→%d)\n", x, y);
        x = 2;
        printf("  σ2 (x→%d, y→%d)\n", x, y);
    }

    printf("σ3 (x→%d, y→%d)\n", x, y);
}

void unoF(void) {
	printf("\nEJ unoF\n");
    int x, y;

    printf("Ingrese un valor para x: ");
    scanf("%d", &x);

    printf("Ingrese un valor para y: ");
    scanf("%d", &y);

    printf("σ0 (x→%d, y→%d)\n", x, y);
    if (x >= y) {
        printf("x >= y\n");
        printf("  σ1 (x→%d, y→%d)\n", x, y);
        x = 0;
        printf("  σ2 (x→%d, y→%d)\n", x, y);
    } if (x <= y) {
        printf("x <= y\n");
        printf("  σ1 (x→%d, y→%d)\n", x, y);
        x = 2;
        printf("  σ2 (x→%d, y→%d)\n", x, y);
    }
    printf("σ3 (x→%d, y→%d)\n", x, y);
}

int main(void) {
    unoE();
    unoF();
	return 0;
}
