	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/phi.ll"
	.globl	test0
	.type	test0,@function
test0:
	.param i32
	.result i32
	.local i32, i32, i32, i32, i32, i32, i32
	block $BB0_2
	get_local 0
	set_local 7, pop
	i32.const -1
	set_local 4, pop
	i32.gt_s (get_local 7), (get_local 4)
	set_local 5, pop
	br_if $BB0_2, (get_local 5)
	i32.const 3
	set_local 6, pop
	i32.div_s (get_local 7), (get_local 6)
	set_local 7, pop
BB0_2:
	return (get_local 7)
func_end0:
	.size	test0, func_end0-test0

	.globl	test1
	.type	test1,@function
test1:
	.param i32
	.result i32
	.local i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32
	i32.const 1
	set_local 7, pop
	i32.const 0
	set_local 10, pop
	get_local 0
	set_local 5, pop
	get_local 7
	set_local 11, pop
	get_local 10
	set_local 12, pop
BB1_1:
	loop $BB1_2
	get_local 11
	set_local 2, pop
	get_local 10
	set_local 11, pop
	i32.add (get_local 12), (get_local 7)
	set_local 12, pop
	i32.lt_s (get_local 12), (get_local 5)
	set_local 9, pop
	get_local 2
	set_local 10, pop
	br_if $BB1_1, (get_local 9)
	return (get_local 11)
func_end1:
	.size	test1, func_end1-test1



