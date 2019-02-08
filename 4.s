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
	.frame	$fp,48,$31		# vars= 32, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48		#add immediately constant -48 to sp and and store it in sp
	sw	$fp,44($sp)		#store word present at 11 address away from sp into fp
	move	$fp,$sp			#move the data from sp to fp
	li	$2,55			# 0x37
	sw	$2,8($fp)
	movz	$31,$31,$0
	lw	$3,8($fp)
	li	$2,2			# 0x2
	bne	$3,$2,$L2
	nop

	li	$2,112			# 0x70
	sb	$2,12($fp)
	b	$L3
	nop

$L2:
	lw	$2,8($fp)
	nop
	andi	$2,$2,0x1
	bne	$2,$0,$L4
	nop

	li	$2,101			# 0x65
	sb	$2,12($fp)
	b	$L3
	nop

$L4:
	lw	$2,8($fp)
	nop
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	sw	$2,16($fp)
	sw	$0,20($fp)
	b	$L5
	nop

$L8:
	lw	$3,8($fp)
	lw	$2,16($fp)
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
	lw	$2,16($fp)
	nop
	addiu	$2,$2,-1
	sw	$2,16($fp)
$L5:
	lw	$2,16($fp)
	nop
	slt	$2,$2,2
	beq	$2,$0,$L8
	nop

$L7:
	lw	$3,20($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L9
	nop

	li	$2,112			# 0x70
	sb	$2,12($fp)
	b	$L3
	nop

$L9:
	li	$2,111			# 0x6f
	sb	$2,12($fp)
$L3:
	lb	$2,12($fp)
	li	$3,111			# 0x6f
	beq	$2,$3,$L11
	nop

	li	$3,112			# 0x70
	beq	$2,$3,$L12
	nop

	li	$3,101			# 0x65
	beq	$2,$3,$L13
	nop

	b	$L10
	nop

$L11:
	sw	$0,24($fp)
	lw	$2,8($fp)
	nop
	addiu	$2,$2,1
	sw	$2,32($fp)
	b	$L14
	nop

$L18:
	lw	$2,32($fp)
	nop
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	sw	$2,28($fp)
	b	$L15
	nop

$L17:
	lw	$3,8($fp)
	lw	$2,28($fp)
	nop
	bne	$2,$0,1f
	div	$0,$3,$2
	break	7
1:
	mfhi	$2
	bne	$2,$0,$L16
	nop

	li	$2,1			# 0x1
	sw	$2,24($fp)
	b	$L14
	nop

$L16:
	lw	$2,28($fp)
	nop
	addiu	$2,$2,-1
	sw	$2,28($fp)
$L15:
	lw	$2,28($fp)
	nop
	slt	$2,$2,2
	beq	$2,$0,$L17
	nop

$L14:
	lw	$3,24($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L18
	nop

	lw	$2,32($fp)
	nop
	sw	$2,8($fp)
$L13:
	lw	$2,8($fp)
	nop
	addiu	$2,$2,1
	sw	$2,8($fp)
	b	$L10
	nop

$L12:
	lw	$2,8($fp)
	nop
	addiu	$2,$2,1
	sw	$2,8($fp)
	nop
$L10:
	move	$2,$0
	move	$sp,$fp
	lw	$fp,44($sp)
	addiu	$sp,$sp,48		#add immediately constant 48 to sp and and store it in sp
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
