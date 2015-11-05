	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/func.ll"
	.globl	f0
	.type	f0,@function
f0:
	return
func_end0:
	.size	f0, func_end0-f0

	.globl	f1
	.type	f1,@function
f1:
	.result i32
	.local i32
	i32.const push, 0
	set_local 0, pop
	return (get_local 0)
func_end1:
	.size	f1, func_end1-f1

	.globl	f2
	.type	f2,@function
f2:
	.param i32
	.param f32
	.result i32
	.local i32
	i32.const push, 0
	set_local 2, pop
	return (get_local 2)
func_end2:
	.size	f2, func_end2-f2

	.globl	f3
	.type	f3,@function
f3:
	.param i32
	.param f32
	return
func_end3:
	.size	f3, func_end3-f3



