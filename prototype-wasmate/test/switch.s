	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/switch.ll"
	.globl	bar32
	.type	bar32,@function
bar32:
	.param i32
	.local i32, i32, i32, i32
	block $BB0_8
	block $BB0_7
	block $BB0_6
	block $BB0_5
	block $BB0_4
	block $BB0_3
	block $BB0_2
	get_local push, 0
	set_local 2, pop
	i32.const push, 23
	set_local 3, pop
	i32.gt_u push, (get_local 2), (get_local 3)
	set_local 4, pop
	br_if $BB0_8, (get_local 4)
	i32.switch (get_local 2), $BB0_2, $BB0_2, $BB0_2, $BB0_2, $BB0_2, $BB0_2, $BB0_2, $BB0_2, $BB0_3, $BB0_3, $BB0_3, $BB0_3, $BB0_3, $BB0_3, $BB0_3, $BB0_3, $BB0_4, $BB0_4, $BB0_4, $BB0_4, $BB0_4, $BB0_4, $BB0_5, $BB0_6, $BB0_7
BB0_2:
	call $foo0
	br $BB0_8
BB0_3:
	call $foo1
	br $BB0_8
BB0_4:
	call $foo2
	br $BB0_8
BB0_5:
	call $foo3
	br $BB0_8
BB0_6:
	call $foo4
	br $BB0_8
BB0_7:
	call $foo5
BB0_8:
	return
func_end0:
	.size	bar32, func_end0-bar32

	.globl	bar64
	.type	bar64,@function
bar64:
	.param i64
	.local i64, i32, i64, i32
	block $BB1_8
	block $BB1_7
	block $BB1_6
	block $BB1_5
	block $BB1_4
	block $BB1_3
	block $BB1_2
	get_local push, 0
	set_local 1, pop
	i64.const push, 23
	set_local 3, pop
	i64.gt_u push, (get_local 1), (get_local 3)
	set_local 4, pop
	br_if $BB1_8, (get_local 4)
	i32.wrap/i64 push, (get_local 1)
	set_local 2, pop
	i32.switch (get_local 2), $BB1_2, $BB1_2, $BB1_2, $BB1_2, $BB1_2, $BB1_2, $BB1_2, $BB1_2, $BB1_3, $BB1_3, $BB1_3, $BB1_3, $BB1_3, $BB1_3, $BB1_3, $BB1_3, $BB1_4, $BB1_4, $BB1_4, $BB1_4, $BB1_4, $BB1_4, $BB1_5, $BB1_6, $BB1_7
BB1_2:
	call $foo0
	br $BB1_8
BB1_3:
	call $foo1
	br $BB1_8
BB1_4:
	call $foo2
	br $BB1_8
BB1_5:
	call $foo3
	br $BB1_8
BB1_6:
	call $foo4
	br $BB1_8
BB1_7:
	call $foo5
BB1_8:
	return
func_end1:
	.size	bar64, func_end1-bar64


	.imports
	.import $foo0 "" "foo0" (param)
	.import $foo1 "" "foo1" (param)
	.import $foo2 "" "foo2" (param)
	.import $foo3 "" "foo3" (param)
	.import $foo4 "" "foo4" (param)
	.import $foo5 "" "foo5" (param)
