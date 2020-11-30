#include<stdio.h>

int pro_Abits(int k) {
    return -1 << k;
}

int pro_Bbits(int j, int k) {
    
    return (~pro_Abits(k)) << j;
}

int main() {
    printf("A: 1^(w-k)0^k = %d\n", pro_Abits(3));
    printf("B: 0^(w-k-j)1^k0^j = %d\n", pro_Bbits(2, 2));
}