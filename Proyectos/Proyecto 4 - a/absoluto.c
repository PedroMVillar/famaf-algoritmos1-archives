#include <stdio.h>
#include <assert.h>

int absol(int x){
  if(x<0){
    return -x;
  }
  return x;
}

void main(){
  int x;
  printf("valor de x:");
  scanf("%d", &x);
  printf("el val absol es: %d", absol(x));
}