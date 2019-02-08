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
	li	$2,4			# 0x4
	sw	$2,8($fp)
	li	$2,9			# 0x9
	sw	$2,12($fp)
	lw	$3,8($fp)
	lw	$2,12($fp)
	nop
	addu	$2,$3,$2
	sw	$2,16($fp)
	lw	$3,8($fp)
	lw	$2,12($fp)
	nop
	subu	$2,$3,$2
	sw	$2,16($fp)
	lw	$3,8($fp)
	lw	$2,12($fp)
	nop
	mult	$3,$2
	mflo	$2
	sw	$2,16($fp)
	lw	$3,8($fp)
	lw	$2,12($fp)
	nop
	bne	$2,$0,1f
	div	$0,$3,$2
	break	7
1:
	mfhi	$2
	mflo	$2
	sw	$2,16($fp)
	lw	$3,8($fp)
	lw	$2,12($fp)
	nop
	and	$2,$3,$2
	sw	$2,16($fp)
	lw	$3,8($fp)
	lw	$2,12($fp)
	nop
	or	$2,$3,$2
	sw	$2,16($fp)
	lw	$3,8($fp)
	lw	$2,12($fp)
	nop
	xor	$2,$3,$2
	sw	$2,16($fp)
	lw	$2,8($fp)
	nop
	sltu	$2,$2,1
	andi	$2,$2,0x00ff
	sw	$2,16($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$fp,28($sp)		#store word present at 7 address away from sp into fp
	addiu	$sp,$sp,32		#add immediately constant 32 to sp and and store it in sp
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
