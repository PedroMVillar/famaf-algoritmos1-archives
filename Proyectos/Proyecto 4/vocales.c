#include <stdio.h>
#include <stdbool.h>

bool es_vocal(char letra);
char pedir_caracter();

int main() {
    char letra = pedir_caracter();
    if (es_vocal(letra)) {
        printf("El caracter ingresado es una vocal.\n");
    } else {
        printf("El caracter ingresado no es una vocal.\n");
    }
    return 0;
}

bool es_vocal(char letra) {
    switch (letra) {
        case 'a':
        case 'e':
        case 'i':
        case 'o':
        case 'u':
        case 'A':
        case 'E':
        case 'I':
        case 'O':
        case 'U':
            return true;
        default:
            return false;
    }
}

char pedir_caracter() {
    char letra;
    printf("Ingrese un caracter: ");
    scanf(" %c", &letra);
    return letra;
}
