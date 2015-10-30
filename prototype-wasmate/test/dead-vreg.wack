	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/dead-vreg.ll"
	.globl	foo
	.type	foo,@function
foo:
	.param i32
	.param i32
	.param i32
	.local i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32
	block $BB0_5
	get_local 2
	set_local 16, pop
	i32.const 1
	set_local 17, pop
	i32.lt_s (get_local 16), (get_local 17)
	set_local 18, pop
	br_if $BB0_5, (get_local 18)
	get_local 1
	set_local 15, pop
	get_local 0
	set_local 30, pop
	i32.const 2
	set_local 20, pop
	i32.const 0
	set_local 19, pop
	i32.shl (get_local 15), (get_local 20)
	set_local 3, pop
	get_local 19
	set_local 31, pop
BB0_2:
	loop $BB0_5
	block $BB0_4
	i32.lt_s (get_local 15), (get_local 17)
	set_local 23, pop
	get_local 19
	set_local 32, pop
	get_local 30
	set_local 33, pop
	get_local 15
	set_local 34, pop
	br_if $BB0_4, (get_local 23)
BB0_3:
	loop $BB0_4
	i32.store (get_local 33), (get_local 32)
	i32.const -1
	set_local 24, pop
	i32.add (get_local 34), (get_local 24)
	set_local 34, pop
	i32.const 4
	set_local 25, pop
	i32.add (get_local 33), (get_local 25)
	set_local 33, pop
	i32.add (get_local 32), (get_local 31)
	set_local 32, pop
	i32.ne (get_local 34), (get_local 19)
	set_local 27, pop
	br_if $BB0_3, (get_local 27)
BB0_4:
	i32.add (get_local 31), (get_local 17)
	set_local 31, pop
	i32.add (get_local 30), (get_local 3)
	set_local 30, pop
	i32.ne (get_local 31), (get_local 16)
	set_local 29, pop
	br_if $BB0_2, (get_local 29)
BB0_5:
	return
func_end0:
	.size	foo, func_end0-foo



