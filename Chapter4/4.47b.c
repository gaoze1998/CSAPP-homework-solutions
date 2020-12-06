#include <stdio.h>

void bubble_b(long *data, long count) {
    long *i;
    long *last;
    long t;
    for(last = data + count - 1; last > data; last--) {
        for(i = data; i < last; i++) {
            if(*(i + 1) < *i) {
                t = *(i + 1);
                *(i + 1) = *i;
                *i = t;
            }
        }
    }
}

int main() {
    long data[] = {2, 1, 4, 3, 5};
    bubble_b(data, 5);
    for(int i = 0; i < 5; i++) {
        printf("%ld ", data[i]);
    }
    printf("\n");
    return 0;
}