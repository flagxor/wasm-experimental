	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/load-store-i1.ll"
	.globl	load_u_i1_i32
	.type	load_u_i1_i32,@function
load_u_i1_i32:
	.param i32
	.result i32
	.local i32, i32
	get_local push, 0
	set_local 1, pop
	i32.load8_u push, (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end0:
	.size	load_u_i1_i32, func_end0-load_u_i1_i32

	.globl	load_s_i1_i32
	.type	load_s_i1_i32,@function
load_s_i1_i32:
	.param i32
	.result i32
	.local i32, i32, i32, i32, i32
	get_local push, 0
	set_local 1, pop
	i32.load8_u push, (get_local 1)
	set_local 2, pop
	i32.const push, 31
	set_local 3, pop
	i32.shl push, (get_local 2), (get_local 3)
	set_local 4, pop
	i32.shr_s push, (get_local 4), (get_local 3)
	set_local 5, pop
	return (get_local 5)
func_end1:
	.size	load_s_i1_i32, func_end1-load_s_i1_i32

	.globl	load_u_i1_i64
	.type	load_u_i1_i64,@function
load_u_i1_i64:
	.param i32
	.result i64
	.local i32, i64
	get_local push, 0
	set_local 1, pop
	i64.load8_u push, (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end2:
	.size	load_u_i1_i64, func_end2-load_u_i1_i64

	.globl	load_s_i1_i64
	.type	load_s_i1_i64,@function
load_s_i1_i64:
	.param i32
	.result i64
	.local i32, i64, i64, i64, i64
	get_local push, 0
	set_local 1, pop
	i64.load8_u push, (get_local 1)
	set_local 2, pop
	i64.const push, 63
	set_local 3, pop
	i64.shl push, (get_local 2), (get_local 3)
	set_local 4, pop
	i64.shr_s push, (get_local 4), (get_local 3)
	set_local 5, pop
	return (get_local 5)
func_end3:
	.size	load_s_i1_i64, func_end3-load_s_i1_i64

	.globl	store_i32_i1
	.type	store_i32_i1,@function
store_i32_i1:
	.param i32
	.param i32
	.local i32, i32, i32, i32
	get_local push, 0
	set_local 2, pop
	get_local push, 1
	set_local 3, pop
	i32.const push, 1
	set_local 4, pop
	i32.and push, (get_local 3), (get_local 4)
	set_local 5, pop
	i32.store8 (get_local 2), (get_local 5)
	return
func_end4:
	.size	store_i32_i1, func_end4-store_i32_i1

	.globl	store_i64_i1
	.type	store_i64_i1,@function
store_i64_i1:
	.param i32
	.param i64
	.local i32, i64, i64, i64
	get_local push, 0
	set_local 2, pop
	get_local push, 1
	set_local 3, pop
	i64.const push, 1
	set_local 4, pop
	i64.and push, (get_local 3), (get_local 4)
	set_local 5, pop
	i64.store8 (get_local 2), (get_local 5)
	return
func_end5:
	.size	store_i64_i1, func_end5-store_i64_i1



