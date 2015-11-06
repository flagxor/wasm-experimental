	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/select.ll"
	.globl	select_i32
	.type	select_i32,@function
select_i32:
	.param i32
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32, i32, i32, i32
	get_local push, 1
	set_local 3, pop
	get_local push, 0
	set_local 4, pop
	get_local push, 2
	set_local 5, pop
	i32.const push, 0
	set_local 6, pop
	i32.eq push, (get_local 5), (get_local 6)
	set_local 7, pop
	i32.select push, (get_local 7), (get_local 4), (get_local 3)
	set_local 8, pop
	return (get_local 8)
func_end0:
	.size	select_i32, func_end0-select_i32

	.globl	select_i64
	.type	select_i64,@function
select_i64:
	.param i64
	.param i64
	.param i32
	.result i64
	.local i64, i64, i32, i32, i32, i64
	get_local push, 1
	set_local 3, pop
	get_local push, 0
	set_local 4, pop
	get_local push, 2
	set_local 5, pop
	i32.const push, 0
	set_local 6, pop
	i32.eq push, (get_local 5), (get_local 6)
	set_local 7, pop
	i64.select push, (get_local 7), (get_local 4), (get_local 3)
	set_local 8, pop
	return (get_local 8)
func_end1:
	.size	select_i64, func_end1-select_i64

	.globl	select_f32
	.type	select_f32,@function
select_f32:
	.param f32
	.param f32
	.param i32
	.result f32
	.local f32, f32, i32, i32, i32, f32
	get_local push, 1
	set_local 3, pop
	get_local push, 0
	set_local 4, pop
	get_local push, 2
	set_local 5, pop
	i32.const push, 0
	set_local 6, pop
	i32.eq push, (get_local 5), (get_local 6)
	set_local 7, pop
	f32.select push, (get_local 7), (get_local 4), (get_local 3)
	set_local 8, pop
	return (get_local 8)
func_end2:
	.size	select_f32, func_end2-select_f32

	.globl	select_f64
	.type	select_f64,@function
select_f64:
	.param f64
	.param f64
	.param i32
	.result f64
	.local f64, f64, i32, i32, i32, f64
	get_local push, 1
	set_local 3, pop
	get_local push, 0
	set_local 4, pop
	get_local push, 2
	set_local 5, pop
	i32.const push, 0
	set_local 6, pop
	i32.eq push, (get_local 5), (get_local 6)
	set_local 7, pop
	f64.select push, (get_local 7), (get_local 4), (get_local 3)
	set_local 8, pop
	return (get_local 8)
func_end3:
	.size	select_f64, func_end3-select_f64



