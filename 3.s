.file	1 ""
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,32,$31		# vars= 16, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32		#add immediately constant -32 to sp and and store it in sp
	sw	$fp,28($sp)		#store word present at 7 address away from sp into fp
	move	$fp,$sp			#move the data from sp to fp
	sw	$4,32($fp)		#store word present at 8 address away from fp into 4
	sw	$5,36($fp)		#store word present at 9 address away from fp into 5
	movz	$31,$31,$0
	li	$2,100			# 0x64
	sw	$2,16($fp)
	li	$2,2			# 0x2
	sw	$2,8($fp)
	b	$L2
	nop

$L9:
	lw	$3,8($fp)
	li	$2,2			# 0x2
	bne	$3,$2,$L3
	nop

	li	$2,1			# 0x1
	sw	$2,20($fp)
	b	$L4
	nop

$L3:
	lw	$2,8($fp)
	nop
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	sw	$2,12($fp)
	b	$L5
	nop

$L8:
	lw	$3,8($fp)
	lw	$2,12($fp)
	nop
	bne	$2,$0,1f
	div	$0,$3,$2
	break	7
1:
	mfhi	$2
	bne	$2,$0,$L6
	nop

	li	$2,1			# 0x1
	sw	$2,20($fp)
	b	$L7
	nop

$L6:
	lw	$2,12($fp)
	nop
	addiu	$2,$2,-1
	sw	$2,12($fp)
$L5:
	lw	$2,12($fp)
	nop
	slt	$2,$2,2
	beq	$2,$0,$L8
	nop

$L7:
	lw	$3,12($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L4
	nop

	sw	$0,20($fp)
$L4:
	lw	$2,8($fp)
	nop
	addiu	$2,$2,1
	sw	$2,8($fp)
$L2:
	lw	$3,8($fp)
	lw	$2,16($fp)
	nop
	slt	$2,$2,$3
	beq	$2,$0,$L9
	nop

	move	$2,$0
	move	$sp,$fp
	lw	$fp,28($sp)		#load word present at 7 address away from sp into fp
	addiu	$sp,$sp,32		#add immediately constant 32 to sp and and store it in sp
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
