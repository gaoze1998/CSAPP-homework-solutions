#include<stdio.h>

int main(int argc, char const *argv[])
{
    int x = 2;
    printf("x << 32 = %d\n", x << 32);
    printf("x * 17 = %d\n", (x << 4) + x);
    printf("x * -7 = %d\n", x - (x << 3)); // neg_number -> -pos_number
    printf("x * 60 = %d\n", (x << 6) - (x << 2));
    printf("x * -112 = %d\n", (x << 4) - (x << 7));
    return 0;
}
