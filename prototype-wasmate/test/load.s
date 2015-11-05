	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/load.ll"
	.globl	ldi32
	.type	ldi32,@function
ldi32:
	.param i32
	.result i32
	.local i32, i32
	get_local 0
	set_local 1, pop
	i32.load (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end0:
	.size	ldi32, func_end0-ldi32

	.globl	ldi64
	.type	ldi64,@function
ldi64:
	.param i32
	.result i64
	.local i32, i64
	get_local 0
	set_local 1, pop
	i64.load (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end1:
	.size	ldi64, func_end1-ldi64

	.globl	ldf32
	.type	ldf32,@function
ldf32:
	.param i32
	.result f32
	.local i32, f32
	get_local 0
	set_local 1, pop
	f32.load (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end2:
	.size	ldf32, func_end2-ldf32

	.globl	ldf64
	.type	ldf64,@function
ldf64:
	.param i32
	.result f64
	.local i32, f64
	get_local 0
	set_local 1, pop
	f64.load (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end3:
	.size	ldf64, func_end3-ldf64



