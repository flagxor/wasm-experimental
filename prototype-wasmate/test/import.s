	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/import.ll"
	.globl	f
	.type	f,@function
f:
	.param i32
	.param f32
	.local f32, i32, i32, f32
	get_local 0
	set_local 3, pop
	get_local 1
	set_local 2, pop
	call $printi, (get_local 3)
	set_local 4, pop
	call $printf, (get_local 2)
	set_local 5, pop
	call $printv
	return
func_end0:
	.size	f, func_end0-f


	.imports
	.import $printi "" "printi" (param i32) (result i32)
	.import $printf "" "printf" (param f32) (result f32)
	.import $printv "" "printv" (param)
	.import $add2 "" "add2" (param i32 i32) (result i32)
