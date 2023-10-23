#include <stdio.h>
#include <assert.h>

int abs(int num) {
    assert(num != -2147483648); // aseguramos que el número no sea el mínimo valor de un int
    if (num < 0) {
        return -num;
    } else {
        return num;
    }
}

int main() {
    int num;
    printf("Ingrese un número entero: ");
    scanf("%d", &num);
    int abs_num = abs(num);
    printf("El valor absoluto de %d es %d\n", num, abs_num);
    return 0;
}
