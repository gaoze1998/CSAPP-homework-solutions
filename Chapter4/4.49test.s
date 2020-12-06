	.file	"4.47b.c"
	.text
	.globl	bubble_b
	.type	bubble_b, @function
bubble_b:
.LFB23:
	.cfi_startproc
	endbr64
	leaq	-8(%rdi,%rsi,8), %rsi
	jmp	.L2
.L3:
	addq	$8, %rax
.L5:
	cmpq	%rsi, %rax
	jnb	.L7

	movq    8(%rax), %r9                # %r9 = *(i + 1)
    movq    (%rax), %r10                # %r10 = *i

	movq    %r9, %r8                    # %r8 = %r9 = *(i + 1)
    movq    %r10, %r11                  # %r11 = %r10 = *i
    xorq    %r9, %r10                   # %r10 = *i ^ *(i + 1)
	cmpq    %r11, %r8                   # cmp *(i + 1) - *i
    cmovge  %r11, %r9                   # if *(i + 1) >= *i, %r9 = *i
    xorq    %r10, %r9                   # %r9 = %r9 ^ %r10 = *(i + 1) or *i ^ *i ^ *(i + 1)
    xorq    %r9, %r10                   # %r10 = %r10 ^ %r9 = *i ^ *(i + 1) ^ ( *(i + 1) or *i )
    movq    %r9, 8(%rax)                
    movq    %r10, (%rax)

	jmp	.L3
.L7:
	subq	$8, %rsi
.L2:
	cmpq	%rdi, %rsi
	jbe	.L8
	movq	%rdi, %rax
	jmp	.L5
.L8:
	ret
	.cfi_endproc
.LFE23:
	.size	bubble_b, .-bubble_b
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%ld "
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movq	$2, (%rsp)
	movq	$1, 8(%rsp)
	movq	$4, 16(%rsp)
	movq	$3, 24(%rsp)
	movq	$5, 32(%rsp)
	movq	%rsp, %rdi
	movl	$5, %esi
	call	bubble_b
	movl	$0, %ebx
.L10:
	cmpl	$4, %ebx
	jg	.L14
	movslq	%ebx, %rax
	movq	(%rsp,%rax,8), %rdx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	addl	$1, %ebx
	jmp	.L10
.L14:
	movl	$10, %edi
	call	putchar@PLT
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L15
	movl	$0, %eax
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
