#include <stdio.h>
#include <stdlib.h>
#include <svdpi.h>

extern void seq_creator(int a, int b);
extern void res();

void test(){
  
    res();
    
    for(int i = 0; i < 10; i++){
     
      int a = rand()%101;
      int b = rand()%101;
        seq_creator(a, b);
    }
    
}