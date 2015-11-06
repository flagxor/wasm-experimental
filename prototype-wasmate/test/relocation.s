	.text
	.file	"relocation.c"
	.globl	main
	.type	main,@function
main:                                   # @main
	.result i32
	.local i32, i32
# BB#0:                                 # %entry
	i32.const push, $a
	set_local 0, pop
	i32.load push, (get_local 0)
	set_local 1, pop
	return (get_local 1)
func_end0:
	.size	main, func_end0-main

	.type	b,@object               # @b
	.data
	.globl	b
	.align	2
b:
	.int32	a
	.size	b, 4

	.type	a,@object               # @a
	.globl	a
	.align	2
a:
	.int32	b
	.size	a, 4



