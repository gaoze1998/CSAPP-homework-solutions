#include <stdio.h>
#include <stdlib.h>
#include "../utils/csapputils.h"

void *basic_memset(void *s, int c, size_t n) {
    unsigned long K = sizeof(unsigned long);
    unsigned long c8 = 0;
    long i, j, k;
    unsigned long *p = s;
    unsigned char *pp = s;

    for(k = 0; k < K; k++) {
        c8 = (c8 | (c & 0xff));
        c8 = (c8 << 8);
    }
    c8 = (c8 | (c & 0xff));

    for(i = 0; i < n; i++) {
        if((unsigned long)s % K == 0) {
            break;
        }
        pp[i] = (unsigned char) c;
    }
    
    p = (unsigned long *)&pp[i];
    for(j = 0; j < ((n - i) / K); j++) {
        p[j] = c8;
    }

    for(i = i + j * 8; i < n; i++) {
        pp[i] = (unsigned char) c;
    }

    return s;
}

int main() {
    int *a = (int *)malloc(9 * sizeof(int));
    a = basic_memset(a, -1, 9 * sizeof(int));
    for(int i = 0; i < 9; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");
    return 0;
}