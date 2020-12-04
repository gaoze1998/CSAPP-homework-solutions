#include<stdio.h>
#include "../utils/csapputils.h"

typedef unsigned float_bits;

float_bits float_absval(float_bits f) {
    float_bits exp = (f >> 23) & 0xff;
    float_bits frac = f & 0x7fffff;
    if((exp == 0xff) && frac) {
        return f;
    }
    return f & 0x8fffffff;
}

int main() {
    float_bits f = 0xae4781bf; // f = -1.01
    float_bits f1 = 0xffffffff; // f1 = NaN

    float_bits ff = float_absval(f);
    float_bits ff1 = float_absval(f1);

    show_bytes((unsigned char *)(&ff), sizeof(float_bits));
    show_bytes((unsigned char *)(&ff1), sizeof(float_bits));
    return 0;
}