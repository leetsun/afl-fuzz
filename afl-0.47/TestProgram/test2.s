	.file	"IsTree.c"
	.text
.Ltext0:
	.comm	father,40000,32
	.comm	height,40000,32
	.comm	inDegree,40000,32
	.comm	visit,10000,32
	.globl	Initial
	.type	Initial, @function
Initial:
.LFB2:
	.file 1 "IsTree.c"
	.loc 1 15 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
.LBB2:
	.loc 1 16 0
	movl	$0, -4(%ebp)
	jmp	.L2
.L3:
	.loc 1 18 0 discriminator 3
	movl	-4(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, father(,%eax,4)
	.loc 1 19 0 discriminator 3
	movl	-4(%ebp), %eax
	movl	$0, height(,%eax,4)
	.loc 1 20 0 discriminator 3
	movl	-4(%ebp), %eax
	movl	$0, inDegree(,%eax,4)
	.loc 1 21 0 discriminator 3
	movl	-4(%ebp), %eax
	addl	$visit, %eax
	movb	$0, (%eax)
	.loc 1 16 0 discriminator 3
	addl	$1, -4(%ebp)
.L2:
	.loc 1 16 0 is_stmt 0 discriminator 1
	cmpl	$9999, -4(%ebp)
	jle	.L3
.LBE2:
	.loc 1 23 0 is_stmt 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	Initial, .-Initial
	.globl	Find
	.type	Find, @function
Find:
.LFB3:
	.loc 1 26 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 27 0
	movl	8(%ebp), %eax
	movl	father(,%eax,4), %eax
	cmpl	8(%ebp), %eax
	je	.L5
	.loc 1 29 0
	movl	8(%ebp), %eax
	movl	father(,%eax,4), %eax
	subl	$12, %esp
	pushl	%eax
	call	Find
	addl	$16, %esp
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, father(,%eax,4)
.L5:
	.loc 1 31 0
	movl	8(%ebp), %eax
	movl	father(,%eax,4), %eax
	.loc 1 32 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	Find, .-Find
	.globl	Union
	.type	Union, @function
Union:
.LFB4:
	.loc 1 35 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 36 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	Find
	addl	$16, %esp
	movl	%eax, 8(%ebp)
	.loc 1 37 0
	subl	$12, %esp
	pushl	12(%ebp)
	call	Find
	addl	$16, %esp
	movl	%eax, 12(%ebp)
	.loc 1 39 0
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	je	.L11
	.loc 1 41 0
	movl	8(%ebp), %eax
	movl	height(,%eax,4), %edx
	movl	12(%ebp), %eax
	movl	height(,%eax,4), %eax
	cmpl	%eax, %edx
	jge	.L9
	.loc 1 43 0
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, father(,%eax,4)
	.loc 1 52 0
	jmp	.L11
.L9:
	.loc 1 44 0
	movl	8(%ebp), %eax
	movl	height(,%eax,4), %edx
	movl	12(%ebp), %eax
	movl	height(,%eax,4), %eax
	cmpl	%eax, %edx
	jle	.L10
	.loc 1 46 0
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, father(,%eax,4)
	.loc 1 52 0
	jmp	.L11
.L10:
	.loc 1 48 0
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, father(,%eax,4)
	.loc 1 49 0
	movl	8(%ebp), %eax
	movl	height(,%eax,4), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, height(,%eax,4)
.L11:
	.loc 1 52 0
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	Union, .-Union
	.globl	IsTree
	.type	IsTree, @function
IsTree:
.LFB5:
	.loc 1 55 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 56 0
	movl	$0, -12(%ebp)
	.loc 1 57 0
	movl	$0, -8(%ebp)
.LBB3:
	.loc 1 58 0
	movl	$1, -4(%ebp)
	jmp	.L13
.L18:
	.loc 1 60 0
	movl	-4(%ebp), %eax
	addl	$visit, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	.L14
	.loc 1 61 0
	movl	-4(%ebp), %eax
	movl	father(,%eax,4), %eax
	cmpl	-4(%ebp), %eax
	jne	.L15
	.loc 1 63 0
	addl	$1, -12(%ebp)
.L15:
	.loc 1 65 0
	movl	-4(%ebp), %eax
	movl	inDegree(,%eax,4), %eax
	testl	%eax, %eax
	jne	.L16
	.loc 1 67 0
	addl	$1, -8(%ebp)
	jmp	.L14
.L16:
	.loc 1 68 0
	movl	-4(%ebp), %eax
	movl	inDegree(,%eax,4), %eax
	cmpl	$1, %eax
	jle	.L14
	.loc 1 70 0
	movl	$0, %eax
	jmp	.L17
.L14:
	.loc 1 58 0 discriminator 2
	addl	$1, -4(%ebp)
.L13:
	.loc 1 58 0 is_stmt 0 discriminator 1
	cmpl	$9999, -4(%ebp)
	jle	.L18
.LBE3:
	.loc 1 74 0 is_stmt 1
	cmpl	$1, -12(%ebp)
	jne	.L19
	.loc 1 74 0 is_stmt 0 discriminator 1
	cmpl	$1, -8(%ebp)
	jne	.L19
	.loc 1 76 0 is_stmt 1
	movl	$1, %eax
	jmp	.L17
.L19:
	.loc 1 78 0
	cmpl	$0, -12(%ebp)
	jne	.L20
	.loc 1 78 0 is_stmt 0 discriminator 1
	cmpl	$0, -8(%ebp)
	jne	.L20
	.loc 1 80 0 is_stmt 1
	movl	$1, %eax
	jmp	.L17
.L20:
	.loc 1 82 0
	movl	$0, %eax
.L17:
	.loc 1 83 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	IsTree, .-IsTree
	.section	.rodata
.LC0:
	.string	"rw"
.LC1:
	.string	"./tc.txt"
.LC2:
	.string	"Failed open tc.txt"
.LC3:
	.string	"%d %d"
.LC4:
	.string	"case %d is a tree.\n"
.LC5:
	.string	"case %d isnot a tree.\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.loc 1 86 0
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$36, %esp
	.loc 1 86 0
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	.loc 1 88 0
	movl	$1, -20(%ebp)
	.loc 1 90 0
	subl	$8, %esp
	pushl	$.LC0
	pushl	$.LC1
	call	fopen
	addl	$16, %esp
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	.L22
	.loc 1 92 0
	subl	$12, %esp
	pushl	$.LC2
	call	puts
	addl	$16, %esp
	.loc 1 93 0
	movl	$1, %eax
	jmp	.L30
.L22:
	.loc 1 95 0
	call	Initial
.L29:
	.loc 1 98 0
	leal	-24(%ebp), %eax
	pushl	%eax
	leal	-28(%ebp), %eax
	pushl	%eax
	pushl	$.LC3
	pushl	-16(%ebp)
	call	__isoc99_fscanf
	addl	$16, %esp
	.loc 1 100 0
	movl	-28(%ebp), %eax
	testl	%eax, %eax
	js	.L24
	.loc 1 100 0 is_stmt 0 discriminator 1
	movl	-24(%ebp), %eax
	testl	%eax, %eax
	js	.L24
	.loc 1 104 0 is_stmt 1
	movl	-28(%ebp), %eax
	testl	%eax, %eax
	jne	.L25
	.loc 1 104 0 is_stmt 0 discriminator 1
	movl	-24(%ebp), %eax
	testl	%eax, %eax
	jne	.L25
	.loc 1 106 0 is_stmt 1
	call	IsTree
	testb	%al, %al
	je	.L26
	.loc 1 108 0
	movl	-20(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -20(%ebp)
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC4
	call	printf
	addl	$16, %esp
	jmp	.L27
.L26:
	.loc 1 111 0
	movl	-20(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -20(%ebp)
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC5
	call	printf
	addl	$16, %esp
.L27:
	.loc 1 113 0
	call	Initial
	jmp	.L28
.L25:
	.loc 1 116 0
	movl	-28(%ebp), %eax
	movb	$1, visit(%eax)
	.loc 1 117 0
	movl	-24(%ebp), %eax
	movb	$1, visit(%eax)
	.loc 1 118 0
	movl	-24(%ebp), %eax
	movl	inDegree(,%eax,4), %edx
	addl	$1, %edx
	movl	%edx, inDegree(,%eax,4)
	.loc 1 119 0
	movl	-24(%ebp), %edx
	movl	-28(%ebp), %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	Union
	addl	$16, %esp
.L28:
	.loc 1 121 0
	jmp	.L29
.L24:
	.loc 1 122 0
	subl	$12, %esp
	pushl	-16(%ebp)
	call	fclose
	addl	$16, %esp
	.loc 1 123 0
	movl	$0, %eax
.L30:
	.loc 1 124 0 discriminator 1
	movl	-12(%ebp), %ecx
	xorl	%gs:20, %ecx
	je	.L31
	.loc 1 124 0 is_stmt 0
	call	__stack_chk_fail
.L31:
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/stdio.h"
	.file 5 "/usr/include/libio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x42b
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF62
	.byte	0xc
	.long	.LASF63
	.long	.LASF64
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF8
	.byte	0x2
	.byte	0xd8
	.long	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x37
	.long	0x61
	.uleb128 0x2
	.long	.LASF10
	.byte	0x3
	.byte	0x83
	.long	0x85
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.long	.LASF11
	.uleb128 0x2
	.long	.LASF12
	.byte	0x3
	.byte	0x84
	.long	0x6f
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF13
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x6
	.byte	0x4
	.long	0xa6
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0x2
	.long	.LASF15
	.byte	0x4
	.byte	0x30
	.long	0xb8
	.uleb128 0x7
	.long	.LASF45
	.byte	0x94
	.byte	0x5
	.byte	0xf1
	.long	0x235
	.uleb128 0x8
	.long	.LASF16
	.byte	0x5
	.byte	0xf2
	.long	0x5a
	.byte	0
	.uleb128 0x8
	.long	.LASF17
	.byte	0x5
	.byte	0xf7
	.long	0xa0
	.byte	0x4
	.uleb128 0x8
	.long	.LASF18
	.byte	0x5
	.byte	0xf8
	.long	0xa0
	.byte	0x8
	.uleb128 0x8
	.long	.LASF19
	.byte	0x5
	.byte	0xf9
	.long	0xa0
	.byte	0xc
	.uleb128 0x8
	.long	.LASF20
	.byte	0x5
	.byte	0xfa
	.long	0xa0
	.byte	0x10
	.uleb128 0x8
	.long	.LASF21
	.byte	0x5
	.byte	0xfb
	.long	0xa0
	.byte	0x14
	.uleb128 0x8
	.long	.LASF22
	.byte	0x5
	.byte	0xfc
	.long	0xa0
	.byte	0x18
	.uleb128 0x8
	.long	.LASF23
	.byte	0x5
	.byte	0xfd
	.long	0xa0
	.byte	0x1c
	.uleb128 0x8
	.long	.LASF24
	.byte	0x5
	.byte	0xfe
	.long	0xa0
	.byte	0x20
	.uleb128 0x9
	.long	.LASF25
	.byte	0x5
	.value	0x100
	.long	0xa0
	.byte	0x24
	.uleb128 0x9
	.long	.LASF26
	.byte	0x5
	.value	0x101
	.long	0xa0
	.byte	0x28
	.uleb128 0x9
	.long	.LASF27
	.byte	0x5
	.value	0x102
	.long	0xa0
	.byte	0x2c
	.uleb128 0x9
	.long	.LASF28
	.byte	0x5
	.value	0x104
	.long	0x26d
	.byte	0x30
	.uleb128 0x9
	.long	.LASF29
	.byte	0x5
	.value	0x106
	.long	0x273
	.byte	0x34
	.uleb128 0x9
	.long	.LASF30
	.byte	0x5
	.value	0x108
	.long	0x5a
	.byte	0x38
	.uleb128 0x9
	.long	.LASF31
	.byte	0x5
	.value	0x10c
	.long	0x5a
	.byte	0x3c
	.uleb128 0x9
	.long	.LASF32
	.byte	0x5
	.value	0x10e
	.long	0x7a
	.byte	0x40
	.uleb128 0x9
	.long	.LASF33
	.byte	0x5
	.value	0x112
	.long	0x3e
	.byte	0x44
	.uleb128 0x9
	.long	.LASF34
	.byte	0x5
	.value	0x113
	.long	0x4c
	.byte	0x46
	.uleb128 0x9
	.long	.LASF35
	.byte	0x5
	.value	0x114
	.long	0x279
	.byte	0x47
	.uleb128 0x9
	.long	.LASF36
	.byte	0x5
	.value	0x118
	.long	0x289
	.byte	0x48
	.uleb128 0x9
	.long	.LASF37
	.byte	0x5
	.value	0x121
	.long	0x8c
	.byte	0x4c
	.uleb128 0x9
	.long	.LASF38
	.byte	0x5
	.value	0x129
	.long	0x9e
	.byte	0x54
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.value	0x12a
	.long	0x9e
	.byte	0x58
	.uleb128 0x9
	.long	.LASF40
	.byte	0x5
	.value	0x12b
	.long	0x9e
	.byte	0x5c
	.uleb128 0x9
	.long	.LASF41
	.byte	0x5
	.value	0x12c
	.long	0x9e
	.byte	0x60
	.uleb128 0x9
	.long	.LASF42
	.byte	0x5
	.value	0x12e
	.long	0x25
	.byte	0x64
	.uleb128 0x9
	.long	.LASF43
	.byte	0x5
	.value	0x12f
	.long	0x5a
	.byte	0x68
	.uleb128 0x9
	.long	.LASF44
	.byte	0x5
	.value	0x131
	.long	0x28f
	.byte	0x6c
	.byte	0
	.uleb128 0xa
	.long	.LASF65
	.byte	0x5
	.byte	0x96
	.uleb128 0x7
	.long	.LASF46
	.byte	0xc
	.byte	0x5
	.byte	0x9c
	.long	0x26d
	.uleb128 0x8
	.long	.LASF47
	.byte	0x5
	.byte	0x9d
	.long	0x26d
	.byte	0
	.uleb128 0x8
	.long	.LASF48
	.byte	0x5
	.byte	0x9e
	.long	0x273
	.byte	0x4
	.uleb128 0x8
	.long	.LASF49
	.byte	0x5
	.byte	0xa2
	.long	0x5a
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x23c
	.uleb128 0x6
	.byte	0x4
	.long	0xb8
	.uleb128 0xb
	.long	0xa6
	.long	0x289
	.uleb128 0xc
	.long	0x97
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x235
	.uleb128 0xb
	.long	0xa6
	.long	0x29f
	.uleb128 0xc
	.long	0x97
	.byte	0x27
	.byte	0
	.uleb128 0xd
	.long	.LASF66
	.byte	0x1
	.byte	0xe
	.long	.LFB2
	.long	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x2cb
	.uleb128 0xe
	.long	.LBB2
	.long	.LBE2-.LBB2
	.uleb128 0xf
	.string	"i"
	.byte	0x1
	.byte	0x10
	.long	0x5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x10
	.long	.LASF67
	.byte	0x1
	.byte	0x19
	.long	0x5a
	.long	.LFB3
	.long	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x2f1
	.uleb128 0x11
	.string	"x"
	.byte	0x1
	.byte	0x19
	.long	0x5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.long	.LASF50
	.byte	0x1
	.byte	0x22
	.long	.LFB4
	.long	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x31f
	.uleb128 0x11
	.string	"x"
	.byte	0x1
	.byte	0x22
	.long	0x5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.string	"y"
	.byte	0x1
	.byte	0x22
	.long	0x5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x13
	.long	.LASF51
	.byte	0x1
	.byte	0x36
	.long	0x36b
	.long	.LFB5
	.long	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x36b
	.uleb128 0x14
	.long	.LASF52
	.byte	0x1
	.byte	0x38
	.long	0x5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.long	.LASF53
	.byte	0x1
	.byte	0x39
	.long	0x5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xe
	.long	.LBB3
	.long	.LBE3-.LBB3
	.uleb128 0xf
	.string	"i"
	.byte	0x1
	.byte	0x3a
	.long	0x5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF54
	.uleb128 0x15
	.long	.LASF55
	.byte	0x1
	.byte	0x55
	.long	0x5a
	.long	.LFB6
	.long	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x3c2
	.uleb128 0x14
	.long	.LASF56
	.byte	0x1
	.byte	0x57
	.long	0x5a
	.uleb128 0x2
	.byte	0x75
	.sleb128 -28
	.uleb128 0x14
	.long	.LASF57
	.byte	0x1
	.byte	0x57
	.long	0x5a
	.uleb128 0x2
	.byte	0x75
	.sleb128 -24
	.uleb128 0xf
	.string	"tc"
	.byte	0x1
	.byte	0x58
	.long	0x5a
	.uleb128 0x2
	.byte	0x75
	.sleb128 -20
	.uleb128 0xf
	.string	"fc"
	.byte	0x1
	.byte	0x59
	.long	0x3c2
	.uleb128 0x2
	.byte	0x75
	.sleb128 -16
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0xad
	.uleb128 0xb
	.long	0x5a
	.long	0x3d9
	.uleb128 0x16
	.long	0x97
	.value	0x270f
	.byte	0
	.uleb128 0x17
	.long	.LASF58
	.byte	0x1
	.byte	0x9
	.long	0x3c8
	.uleb128 0x5
	.byte	0x3
	.long	father
	.uleb128 0x17
	.long	.LASF59
	.byte	0x1
	.byte	0xa
	.long	0x3c8
	.uleb128 0x5
	.byte	0x3
	.long	height
	.uleb128 0x17
	.long	.LASF60
	.byte	0x1
	.byte	0xb
	.long	0x3c8
	.uleb128 0x5
	.byte	0x3
	.long	inDegree
	.uleb128 0xb
	.long	0x36b
	.long	0x41d
	.uleb128 0x16
	.long	0x97
	.value	0x270f
	.byte	0
	.uleb128 0x17
	.long	.LASF61
	.byte	0x1
	.byte	0xc
	.long	0x40c
	.uleb128 0x5
	.byte	0x3
	.long	visit
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF10:
	.string	"__off_t"
.LASF17:
	.string	"_IO_read_ptr"
.LASF29:
	.string	"_chain"
.LASF8:
	.string	"size_t"
.LASF35:
	.string	"_shortbuf"
.LASF64:
	.string	"/home/bluesky/src/afl/afl-0.47/proc"
.LASF23:
	.string	"_IO_buf_base"
.LASF7:
	.string	"long long unsigned int"
.LASF58:
	.string	"father"
.LASF60:
	.string	"inDegree"
.LASF6:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF30:
	.string	"_fileno"
.LASF18:
	.string	"_IO_read_end"
.LASF11:
	.string	"long int"
.LASF16:
	.string	"_flags"
.LASF24:
	.string	"_IO_buf_end"
.LASF33:
	.string	"_cur_column"
.LASF9:
	.string	"__quad_t"
.LASF32:
	.string	"_old_offset"
.LASF37:
	.string	"_offset"
.LASF46:
	.string	"_IO_marker"
.LASF0:
	.string	"unsigned int"
.LASF3:
	.string	"long unsigned int"
.LASF21:
	.string	"_IO_write_ptr"
.LASF48:
	.string	"_sbuf"
.LASF2:
	.string	"short unsigned int"
.LASF25:
	.string	"_IO_save_base"
.LASF36:
	.string	"_lock"
.LASF31:
	.string	"_flags2"
.LASF43:
	.string	"_mode"
.LASF67:
	.string	"Find"
.LASF13:
	.string	"sizetype"
.LASF22:
	.string	"_IO_write_end"
.LASF65:
	.string	"_IO_lock_t"
.LASF45:
	.string	"_IO_FILE"
.LASF49:
	.string	"_pos"
.LASF50:
	.string	"Union"
.LASF28:
	.string	"_markers"
.LASF61:
	.string	"visit"
.LASF63:
	.string	"IsTree.c"
.LASF54:
	.string	"_Bool"
.LASF1:
	.string	"unsigned char"
.LASF57:
	.string	"second"
.LASF5:
	.string	"short int"
.LASF34:
	.string	"_vtable_offset"
.LASF15:
	.string	"FILE"
.LASF56:
	.string	"first"
.LASF14:
	.string	"char"
.LASF62:
	.string	"GNU C11 5.4.0 20160609 -m32 -mtune=generic -march=i686 -g -fstack-protector-strong"
.LASF66:
	.string	"Initial"
.LASF47:
	.string	"_next"
.LASF12:
	.string	"__off64_t"
.LASF19:
	.string	"_IO_read_base"
.LASF27:
	.string	"_IO_save_end"
.LASF38:
	.string	"__pad1"
.LASF39:
	.string	"__pad2"
.LASF40:
	.string	"__pad3"
.LASF41:
	.string	"__pad4"
.LASF42:
	.string	"__pad5"
.LASF51:
	.string	"IsTree"
.LASF44:
	.string	"_unused2"
.LASF52:
	.string	"component"
.LASF26:
	.string	"_IO_backup_base"
.LASF59:
	.string	"height"
.LASF55:
	.string	"main"
.LASF20:
	.string	"_IO_write_base"
.LASF53:
	.string	"root"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
