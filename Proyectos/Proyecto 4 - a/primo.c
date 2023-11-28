#include <stdio.h>
#include <stdbool.h>

bool es_primo(int num) {
    if (num <= 1) return false;
    int i = 2;
    while (i * i <= num) {
        if (num % i == 0) return false;
        i++;
    }
    return true;
}

int nesimo_primo(int n) {
    int contador_primos = 0; 
    int candidato = 2; 
    while (contador_primos < n) { 
        if (es_primo(candidato)) { 
            contador_primos++; 
        }
        candidato++; 
    }
    return candidato - 1; 
}


int main(){
    int x;
    printf("Ingrese un numero: ");
    scanf("%d", &x);
    int np = nesimo_primo(x);
    printf("El n-esimo primo es: %d", np);
    return 0;
}
