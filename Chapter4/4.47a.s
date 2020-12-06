bubble_b:
	leaq	-1(%rsi), %r9          # %r9 = count - 1 -> last = count - 1
	jmp	.L2
.L3:
	addq	$1, %rax               # i++
.L5:
	cmpq	%r9, %rax              # cmp i - last
	jge	.L7                        # if i >= last goto .L7
	leaq	8(%rdi,%rax,8), %rsi   # else %rsi = &data[i + 1]
	movq	(%rsi), %rcx           # %rcx = data[i + 1] -> t = data[i + 1]
	leaq	(%rdi,%rax,8), %rdx    # %rdx = &data[i]
	movq	(%rdx), %r8            # %r8 = data[i]
	cmpq	%r8, %rcx              # cmp data[i + 1] - dara[i]
	jge	.L3                        # if data[i + 1] >= dara[i] goto .L3
	movq	%r8, (%rsi)            # else data[i + 1] = data[i]
	movq	%rcx, (%rdx)           # data[i] = t
	jmp	.L3
.L7:
	subq	$1, %r9                # last = last - 1
.L2:
	testq	%r9, %r9			   # test last == 0
	jle	.L8						   # if last <= 0 goto .L8
	movl	$0, %eax               # else %eax = 0 -> i = 0
	jmp	.L5                        # goto .L5
.L8:
	ret                            # return