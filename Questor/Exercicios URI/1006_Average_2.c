#include <stdio.h>
 
int main() {
 
    float A, B, C;
    
    scanf("%f %f %f", &A, &B, &C);
    
    printf("MEDIA = %.1f\n", (A*2 + B*3 + C*5)/(3+2+5));

    return 0;
}