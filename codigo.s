.data
msgNumDes:		.asciiz "Digite o numero desejado da sequencia (desconsidere o 1 duplo):\n"
msgNumEnc1:		.asciiz "\n\n\nO \n"
msgNumEnc2:		.asciiz "º \n"
msgNumEnc3:		.asciiz "numero da sequencia, desconsiderando o 1 duplo, é: \n"
numeroSeq:		.word 1
ultimo:			.word 1
.text
main: 	addi	$sp,$sp,-16
		sw		$s0,0($sp)
		sw		$s1,4($sp)
		sw		$a0,8($sp)
		sw		$ra,12($sp)
		li		$v0,4
		la		$a0, msgNumDes
		syscall		
		li 		$v0,5
		syscall
		sw 		$v0,numeroSeq
		lw		$s0,numeroSeq		
		add		$a0,$s0,$0
		jal		FIB
		sw		$v0,ultimo
		li		$v0,4
		la		$a0,msgNumEnc1
		syscall	
		li		$v0,1
		lw		$a0,numeroSeq
		syscall		
		li		$v0,4
		la		$a0,msgNumEnc2
		syscall
		li		$v0,4
		la		$a0,msgNumEnc3
		syscall		
		li		$v0,1
		lw		$a0,ultimo
		syscall
		lw		$s0,0($sp)
		lw		$s1,4($sp)
		lw		$a0,8($sp)
		lw		$ra,12($sp)
		addi	$sp,$sp,16	
FIB:	addi	$sp,$sp,-16
		sw		$s0,0($sp)
		sw		$s1,4($sp)
		sw		$s2,8($sp)
		sw		$s3,12($sp)
		addi	$s1,$0,1
		addi	$s0,$0,0
		addi	$s2,$0,0
		addi	$s3,$0,1
		add		$s4,$a0,$0
for:	slt		$t0,$s0,$s4
		beq		$t0,$0,F_for
		add		$s1,$s2,$s3
		add		$s2,$0,$s3
		add		$s3,$0,$s1
		addi	$s0,$s0,1
		j		for
		
F_for:	add		$v0,$s1,$0

		lw		$s0,0($sp)
		lw		$s1,4($sp)
		lw		$s2,8($sp)
		lw		$s3,12($sp)
		addi	$sp,$sp,16
		jr		$ra