	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/store-trunc.ll"
	.globl	trunc_i8_i32
	.type	trunc_i8_i32,@function
trunc_i8_i32:
	.param i32
	.param i32
	.local i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i32.store8 (get_local 3), (get_local 2)
	return
func_end0:
	.size	trunc_i8_i32, func_end0-trunc_i8_i32

	.globl	trunc_i16_i32
	.type	trunc_i16_i32,@function
trunc_i16_i32:
	.param i32
	.param i32
	.local i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i32.store16 (get_local 3), (get_local 2)
	return
func_end1:
	.size	trunc_i16_i32, func_end1-trunc_i16_i32

	.globl	trunc_i8_i64
	.type	trunc_i8_i64,@function
trunc_i8_i64:
	.param i32
	.param i64
	.local i64, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i64.store8 (get_local 3), (get_local 2)
	return
func_end2:
	.size	trunc_i8_i64, func_end2-trunc_i8_i64

	.globl	trunc_i16_i64
	.type	trunc_i16_i64,@function
trunc_i16_i64:
	.param i32
	.param i64
	.local i64, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i64.store16 (get_local 3), (get_local 2)
	return
func_end3:
	.size	trunc_i16_i64, func_end3-trunc_i16_i64

	.globl	trunc_i32_i64
	.type	trunc_i32_i64,@function
trunc_i32_i64:
	.param i32
	.param i64
	.local i64, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i64.store32 (get_local 3), (get_local 2)
	return
func_end4:
	.size	trunc_i32_i64, func_end4-trunc_i32_i64



