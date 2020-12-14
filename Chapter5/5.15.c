#include <stdio.h>
#include <stdlib.h>
#include "../utils/vec.h"

void inner5(vec_ptr u, vec_ptr v, data_t* dest) {
    long i;
    long length = vec_length(u);
    long* udata = get_vec_start(u);
    long* vdata = get_vec_start(v);
    data_t sum1 = (data_t) 0;
    data_t sum2 = (data_t) 0;
    data_t sum3 = (data_t) 0;
    data_t sum4 = (data_t) 0;
    data_t sum5 = (data_t) 0;
    data_t sum6 = (data_t) 0;

    for(i = 0; i < length - 6; i += 6) {
        sum1 = sum1 + udata[i] * vdata[i];
        sum2 = sum2 + udata[i + 1] * vdata[i + 1];
        sum3 = sum3 + udata[i + 2] * vdata[i + 2];
        sum4 = sum4 + udata[i + 3] * vdata[i + 3];
        sum5 = sum5 + udata[i + 4] * vdata[i + 4];
        sum6 = sum6 + udata[i + 5] * vdata[i + 5];
    }
    for(; i < length; i++) {
        sum6 = sum6 + udata[i] * vdata[i];
    }
    *dest = sum1 + sum2 + sum3 + sum4 + sum5 + sum6;
}

int main() {
    struct vec vecu;
    vecu.length = 13;
    vecu.data = (long*)malloc(13 * sizeof(data_t));
    for(int i = 0; i < 13; i++) {
        vecu.data[i] = i;
    }
    struct vec vecv;
    vecv.length = 13;
    vecv.data = (long*)malloc(13 * sizeof(data_t));
    for(int i = 0; i < 13; i++) {
        vecv.data[i] = i;
    }
    long sum;
    inner5(&vecu, &vecv, &sum);
    printf("%ld\n", sum);
    return 0;
}