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
	.frame	$fp,80,$31		# vars= 64, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-80		#add immediately constant -80 to sp and and store it in sp
	sw	$fp,76($sp)		#store word present at 19 address away from sp into fp
	move	$fp,$sp			#move the data from sp to fp
	sw	$4,80($fp)		#store word present at 20 address away from fp into 4
	sw	$5,84($fp)		#store word present at 21 address away from fp into 5
	movz	$31,$31,$0
	li	$2,1			# 0x1
	sw	$2,20($fp)
	li	$2,9			# 0x9
	sw	$2,24($fp)
	li	$2,-4			# 0xfffffffffffffffc
	sw	$2,28($fp)
	li	$2,6			# 0x6
	sw	$2,32($fp)
	li	$2,9			# 0x9
	sw	$2,36($fp)
	li	$2,3			# 0x3
	sw	$2,40($fp)
	li	$2,6			# 0x6
	sw	$2,12($fp)
	li	$2,9			# 0x9
	sw	$2,44($fp)
	li	$2,99			# 0x63
	sw	$2,48($fp)
	li	$2,999			# 0x3e7
	sw	$2,52($fp)
	li	$2,4			# 0x4
	sw	$2,56($fp)
	li	$2,55			# 0x37
	sw	$2,60($fp)
	li	$2,621			# 0x26d
	sw	$2,64($fp)
	li	$2,33			# 0x21
	sw	$2,16($fp)
	sw	$0,8($fp)
	b	$L2
	nop

$L3:
	lw	$2,8($fp)
	nop
	sll	$2,$2,2
	addiu	$3,$fp,8
	addu	$2,$3,$2
	lw	$3,12($2)
	lw	$2,12($fp)
	nop
	addu	$3,$3,$2
	lw	$2,8($fp)
	nop
	sll	$2,$2,2
	addiu	$4,$fp,8
	addu	$2,$4,$2
	sw	$3,12($2)
	lw	$2,8($fp)
	nop
	sll	$2,$2,2
	addiu	$3,$fp,8
	addu	$2,$3,$2
	lw	$3,36($2)
	lw	$2,16($fp)
	nop
	addu	$3,$3,$2
	lw	$2,8($fp)
	nop
	sll	$2,$2,2
	addiu	$4,$fp,8
	addu	$2,$4,$2
	sw	$3,36($2)
	lw	$2,8($fp)
	nop
	addiu	$2,$2,1
	sw	$2,8($fp)
$L2:
	lw	$2,8($fp)
	nop
	slt	$2,$2,6
	bne	$2,$0,$L3
	nop

	move	$2,$0
	move	$sp,$fp
	lw	$fp,76($sp)		#load word present at 19 address away from sp into fp
	addiu	$sp,$sp,80		#add immediately constant 80 to sp and and store it in sp
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
