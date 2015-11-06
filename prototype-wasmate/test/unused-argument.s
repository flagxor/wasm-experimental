	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/unused-argument.ll"
	.globl	unused_first
	.type	unused_first,@function
unused_first:
	.param i32
	.param i32
	.result i32
	.local i32
	get_local push, 1
	set_local 2, pop
	return (get_local 2)
func_end0:
	.size	unused_first, func_end0-unused_first

	.globl	unused_second
	.type	unused_second,@function
unused_second:
	.param i32
	.param i32
	.result i32
	.local i32
	get_local push, 0
	set_local 2, pop
	return (get_local 2)
func_end1:
	.size	unused_second, func_end1-unused_second



