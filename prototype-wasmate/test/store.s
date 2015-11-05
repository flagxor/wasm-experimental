	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/store.ll"
	.globl	sti32
	.type	sti32,@function
sti32:
	.param i32
	.param i32
	.local i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i32.store (get_local 3), (get_local 2)
	return
func_end0:
	.size	sti32, func_end0-sti32

	.globl	sti64
	.type	sti64,@function
sti64:
	.param i32
	.param i64
	.local i64, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i64.store (get_local 3), (get_local 2)
	return
func_end1:
	.size	sti64, func_end1-sti64

	.globl	stf32
	.type	stf32,@function
stf32:
	.param i32
	.param f32
	.local f32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f32.store (get_local 3), (get_local 2)
	return
func_end2:
	.size	stf32, func_end2-stf32

	.globl	stf64
	.type	stf64,@function
stf64:
	.param i32
	.param f64
	.local f64, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f64.store (get_local 3), (get_local 2)
	return
func_end3:
	.size	stf64, func_end3-stf64



