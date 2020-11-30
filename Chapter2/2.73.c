#include<stdio.h>
#include<limits.h>

int saturating_add(int x, int y) {
    int sum = x + y;
    int w = sizeof(int) << 3;
    int x_sign = x >> (w - 1);
    int y_sign = y >> (w - 1);
    int sum_sign = sum >> (w - 1);
    int pos_overflow = !x_sign && !y_sign && sum_sign; // use logic op, result = 0/1(false or true)
    int neg_overflow = x_sign && y_sign && !sum_sign; // so replace if statement
    int overflow = pos_overflow || neg_overflow;
    overflow <<= w - 1;
    overflow >>= w - 1;
    int result = (sum & ~overflow) + ((INT_MAX + !pos_overflow) & overflow);
    return result;
}

int main() {
    printf("INT_MAX: %d, INT_MIN: %d\n", INT_MAX, INT_MIN);
    int x1 = INT_MAX, y1 = 1;
    printf("%d\n", saturating_add(x1, y1));
    int x2 = INT_MIN, y2 = -1;
    printf("%d\n", saturating_add(x2, y2));
    int x3 = 1, y3 = 1;
    printf("%d\n", saturating_add(x3, y3));
    return 0;
}