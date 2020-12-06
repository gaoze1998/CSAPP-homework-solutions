bubble_bcm3:
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

	movq    8(%rax), %r8             # %r8 = *(i + 1)
	movq    (%rax), %r9              # %r9 = *i
    cmovl   %rcx, %r8                # if true, %r8 = *i
    cmovl   %rdx, %r9                # if true, %r9 = *(i + 1)
    movq    %r8, 8(%rax) 
    movq    %r9, (%rax)

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