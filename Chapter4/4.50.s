switchv:
	irmovq $0, %rax
	irmovq $0, %r8
	cmpq %r8, %rdi        # cmp idx:0
	jl .L5
	irmovq $5, %r8
	cmpq %r8, %rdi        # cmp idx:5
	jg .L5

mul:                      # idx * 8
	irmovq $3, %rcx
	addq %rdi, %rdi
	irmovq $1, %r8
	subq %r8, %rcx
	irmovq $0, %r8
	cmpq %r8, %rcx
	jg mul

	irmovq L1, %r8
	addq %r8, %rdi
	pushq %rdi
	ret

.L2:
	irmovq $0xaaa, %rax
	ret
.L3:
	irmovq $0xbbb, %rax
	ret
.L4:
	irmovq $0xccc, %rax
	ret
.L5:
	irmovq $0xddd, %rax
	ret

.section .rodata
.align 8
.L1:
	.quad    .L2          # case 0
	.quad    .L5          # 1
	.quad    .L3		  # case 2
	.quad    .L4          # case 3
	.quad    .L5          # 4
	.quad    .L3          # case 5
	.quad    .L5          # case default
