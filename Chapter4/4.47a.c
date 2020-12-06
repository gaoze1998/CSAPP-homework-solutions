#include <stdio.h>

void bubble_b(long *data, long count) {
    long i, last, t;
    for(last = count - 1; last > 0; last--) {
        for(i = 0; i < last; i++) {
            if(data[i + 1] < data[i]) {
                t = data[i + 1];
                data[i + 1] = data[i];
                data[i] = t;
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