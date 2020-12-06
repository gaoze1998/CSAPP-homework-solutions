bubble_bcm1:
	leaq	-8(%rdi,%rsi,8), %rsi    # last = data + count - 1
	jmp	.L2                          # goto .L2
.L3:
	addq	$8, %rax                 # i = i + 1
.L5:
	cmpq	%rsi, %rax               # cmp i - last
	jnb	.L7                          # if i >= last goto .L7
	movq	8(%rax), %rdx            # else %rdx = *(i + 1) -> t = *(i + 1)
	movq	(%rax), %rcx             # %rcx = *i
	cmpq	%rcx, %rdx               # cmp *(i + 1) - *i

    ######################################################
    #                        begin                       #
    ######################################################

    movq 8(%rax), %r9                # %r9 = *(i + 1)
    movq (%rax), %r10                # %r10 = *i

    movq %r10, %r11                  # %r11 = %r10 = *i
    xorq %r9, %r10                   # %r10 = *i ^ *(i + 1)
    cmovge %r11, %r9                 # if *(i + 1) >= *i, %r9 = *i
    xorq %r10, %r9                   # %r9 = %r9 ^ %r10 = *(i + 1) or *i ^ *i ^ *(i + 1)
    xorq %r9, %r10                   # %r10 = %r10 ^ %r9 = *i ^ *(i + 1) ^ ( *(i + 1) or *i )
    movq %r9, 8(%rax)                
    movq %r10, (%rax)

    ######################################################
    #                        end                         #
    ######################################################

	jmp	.L3                          # goto .L3
.L7:
	subq	$8, %rsi                 # last = last - 1
.L2:
	cmpq	%rdi, %rsi               # cmp last - data
	jbe	.L8                          # if last <= data goto .L8
	movq	%rdi, %rax               # else i = data
	jmp	.L5                          # goto .L5
.L8:
	ret                              # return