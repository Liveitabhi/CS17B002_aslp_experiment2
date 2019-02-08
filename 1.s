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
	addu	$2,$3,$2		#add unsigned value in 3 to 2 and and store it in 2
	sw	$2,16($fp)		#store word present at 7 address away from sp into fp
	lw	$3,8($fp)		#load word present at 2 address away from fp into 3
	lw	$2,12($fp)		#load word present at 3 address away from fp into 2
	nop
	subu	$2,$3,$2		#subtract unsigned value in 2 from that in 3 and and store it in 2
	sw	$2,16($fp)		#store word present at 4 address away from fp into 2
	lw	$3,8($fp)		#load word present at 2 address away from fp into 3
	lw	$2,12($fp)		#load word present at 3 address away from fp into 2
	nop
	mult	$3,$2			#multiplies value present in 3 with that in 2 and stores the result in LO
	mflo	$2			#move data from LO register to 2 
	sw	$2,16($fp)		#store word present at 4 address away from fp into 2
	lw	$3,8($fp)		#load word present at 2 address away from fp into 3
	lw	$2,12($fp)		#load word present at 3 address away from fp into 2
	nop
	bne	$2,$0,1f		#branch to 1f if data in 2 is not equal to that in 0
	div	$0,$3,$2		#divide the data in 3 from that in 2 and store the result in 0
	break	7
1:
	mfhi	$2			#move data from HI register to 2 
	mflo	$2			#move data from LO register to 2 
	sw	$2,16($fp)
	lw	$3,8($fp)
	lw	$2,12($fp)
	nop
	and	$2,$3,$2		#logical and of content in 3 and 2 is stored in 2
	sw	$2,16($fp)
	lw	$3,8($fp)
	lw	$2,12($fp)
	nop
	or	$2,$3,$2		#logical or of content in 3 and 2 is stored in 2
	sw	$2,16($fp)
	lw	$3,8($fp)
	lw	$2,12($fp)
	nop
	xor	$2,$3,$2		#logical xor of content in 3 and 2 is stored in 2
	sw	$2,16($fp)
	lw	$2,8($fp)
	nop
	sltu	$2,$2,1			#set 2 to 1 if $2 is less than 1 else set 0
	andi	$2,$2,0x00ff
	sw	$2,16($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$fp,28($sp)		#load word present at 7 address away from sp into fp
	addiu	$sp,$sp,32		#add immediately constant 32 to sp and and store it in sp
	j	$31			#jump to 31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
