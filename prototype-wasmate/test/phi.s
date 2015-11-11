	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/phi.ll"
	.globl	test0
	.type	test0,@function
test0:
	.param i32
	.result i32
	.local i32, i32, i32, i32, i32, i32, i32
	block $BB0_2
	get_local push, 0
	set_local 7, pop
	i32.const push, -1
	set_local 4, pop
	i32.gt_s push, (get_local 7), (get_local 4)
	set_local 5, pop
	br_if $BB0_2, (get_local 5)
	i32.const push, 3
	set_local 6, pop
	i32.div_s push, (get_local 7), (get_local 6)
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
	i32.const push, 1
	set_local 7, pop
	i32.const push, 0
	set_local 10, pop
	get_local push, 0
	set_local 5, pop
	get_local push, 7
	set_local 11, pop
	get_local push, 10
	set_local 12, pop
BB1_1:
	loop $BB1_2
	get_local push, 11
	set_local 2, pop
	get_local push, 10
	set_local 11, pop
	i32.add push, (get_local 12), (get_local 7)
	set_local 12, pop
	i32.lt_s push, (get_local 12), (get_local 5)
	set_local 9, pop
	get_local push, 2
	set_local 10, pop
	br_if $BB1_1, (get_local 9)
# BB#2:
	return (get_local 11)
func_end1:
	.size	test1, func_end1-test1



