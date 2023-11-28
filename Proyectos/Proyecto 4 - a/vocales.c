#include <stdio.h>
#include<stdbool.h>

bool es_vocal(char letra){
  if (letra == 'a' || letra == 'e' || letra == 'i' || letra == 'o' || letra == 'u' || letra == 'A' || letra == 'E' || letra == 'I' || letra == 'O' || letra == 'U'){
    return true;
} else {
    return false;
}
}



int pedir_caracter(){
  char x;
  printf("Ingrese una letra: ");
  scanf("%c", &x);
  return x;
}

int main(){
char letra = pedir_caracter();
  if (es_vocal(letra) == 1){
    printf("verdadero");
  }else{
    printf("falso");
  }
return 0;

  
}

/*
Ingrese una letra: u
verdadero
Ingrese una letra: p
falso
*/