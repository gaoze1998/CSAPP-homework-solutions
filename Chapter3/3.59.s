# typedef __int128 int128_t
# void store_prode(int128_t *dest, int64_t x, int64_t y) {
#   *dest = x * (int128_t)y;    
# }

store_prode:

    # %rdi = dest, %rsi = x, %rdx = y
    # x_i or y_i represent x's or y's ith bit
    # x_h, x_l, y_h and y_l represent x's or y's high 64bit or low 64bit
    # dest + i is byte level add, not int128_t level add

    movq %rdx, %rax     # %rax = y
    cqto                # %rdx = -y_63 -> -y_63 in fact is (int128_t)y's high 64bit, same as y_h
    movq %rsi, %rcx     # %rcx = x

    sarq $63, %rcx      # %rcx = -x_63 -> x_h

    imulq %rax, %rcx    # %rcx = x_h * y
    imulq %rsi, %rdx    # %rdx = y_h * x
    addq %rdx, %rcx     # %rcx = x_h * y + y_h * x
    mulq %rsi           # %rdx:%rax = x *u y, *u represent unsigned mult

    addq %rcx, %rdx     # %rdx = (x *u y)_h + ( x_h * y + y_h * x ) = x_h * y_h * 2e128 + ( x_h * y + y_h * x )
                               = x_h * y + y_h * x. ref 2.18

    movq %rax, (%rdi)   # *dest = (x *u y)_l = x_l * y_l
    movq %rdx, 8(%rdi)  # *(dest + 8) = x_h * y + y_h * x
    ret                 # return
