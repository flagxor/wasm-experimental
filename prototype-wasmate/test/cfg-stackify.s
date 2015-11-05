	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/cfg-stackify.ll"
	.globl	test0
	.type	test0,@function
test0:
	.param i32
	.local i32, i32, i32, i32, i32, i32, i32
	block $BB0_3
	i32.const push, 0
	set_local 7, pop
	get_local push, 0
	set_local 3, pop
	i32.const push, 1
	set_local 5, pop
BB0_1:
	loop $BB0_3
	block $BB0_2
	i32.add push, (get_local 7), (get_local 5)
	set_local 7, pop
	i32.lt_s push, (get_local 7), (get_local 3)
	set_local 6, pop
	br_if $BB0_2, (get_local 6)
	br $BB0_3
BB0_2:
	call $something
	br $BB0_1
BB0_3:
	return
func_end0:
	.size	test0, func_end0-test0

	.globl	test1
	.type	test1,@function
test1:
	.param i32
	.local i32, i32, i32, i32, i32, i32, i32
	block $BB1_3
	i32.const push, 0
	set_local 7, pop
	get_local push, 0
	set_local 3, pop
	i32.const push, 1
	set_local 5, pop
BB1_1:
	loop $BB1_3
	block $BB1_2
	i32.add push, (get_local 7), (get_local 5)
	set_local 7, pop
	i32.lt_s push, (get_local 7), (get_local 3)
	set_local 6, pop
	br_if $BB1_2, (get_local 6)
	br $BB1_3
BB1_2:
	call $something
	br $BB1_1
BB1_3:
	return
func_end1:
	.size	test1, func_end1-test1

	.globl	test2
	.type	test2,@function
test2:
	.param i32
	.param i32
	.local i32, i32, i32, i32, i32, i32, i32, i32, f64, f64, f64, i32, i32, i32, i32, i32, i32
	block $BB2_2
	get_local push, 1
	set_local 18, pop
	get_local push, 0
	set_local 17, pop
	i32.const push, 1
	set_local 8, pop
	i32.lt_s push, (get_local 18), (get_local 8)
	set_local 9, pop
	br_if $BB2_2, (get_local 9)
BB2_1:
	loop $BB2_2
	f64.load push, (get_local 17)
	set_local 10, pop
	f64.const push, 0x1.999999999999ap1
	set_local 11, pop
	f64.mul push, (get_local 10), (get_local 11)
	set_local 12, pop
	f64.store (get_local 17), (get_local 12)
	i32.const push, -1
	set_local 13, pop
	i32.add push, (get_local 18), (get_local 13)
	set_local 18, pop
	i32.const push, 8
	set_local 14, pop
	i32.add push, (get_local 17), (get_local 14)
	set_local 17, pop
	i32.const push, 0
	set_local 15, pop
	i32.ne push, (get_local 18), (get_local 15)
	set_local 16, pop
	br_if $BB2_1, (get_local 16)
BB2_2:
	return
func_end2:
	.size	test2, func_end2-test2

	.globl	doublediamond
	.type	doublediamond,@function
doublediamond:
	.param i32
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32
	block $BB3_5
	block $BB3_4
	block $BB3_2
	get_local push, 2
	set_local 4, pop
	get_local push, 0
	set_local 5, pop
	i32.const push, 0
	set_local 6, pop
	i32.store (get_local 4), (get_local 6)
	i32.ne push, (get_local 5), (get_local 6)
	set_local 7, pop
	br_if $BB3_2, (get_local 7)
	i32.const push, 1
	set_local 13, pop
	i32.store (get_local 4), (get_local 13)
	br $BB3_5
BB3_2:
	get_local push, 1
	set_local 3, pop
	i32.const push, 2
	set_local 8, pop
	i32.store (get_local 4), (get_local 8)
	i32.ne push, (get_local 3), (get_local 6)
	set_local 10, pop
	br_if $BB3_4, (get_local 10)
	i32.const push, 3
	set_local 12, pop
	i32.store (get_local 4), (get_local 12)
	br $BB3_5
BB3_4:
	i32.const push, 4
	set_local 11, pop
	i32.store (get_local 4), (get_local 11)
BB3_5:
	i32.const push, 5
	set_local 14, pop
	i32.store (get_local 4), (get_local 14)
	return (get_local 6)
func_end3:
	.size	doublediamond, func_end3-doublediamond

	.globl	triangle
	.type	triangle,@function
triangle:
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32, i32, i32, i32, i32
	block $BB4_2
	get_local push, 0
	set_local 2, pop
	get_local push, 1
	set_local 3, pop
	i32.const push, 0
	set_local 4, pop
	i32.store (get_local 2), (get_local 4)
	i32.ne push, (get_local 3), (get_local 4)
	set_local 5, pop
	br_if $BB4_2, (get_local 5)
	i32.const push, 1
	set_local 6, pop
	i32.store (get_local 2), (get_local 6)
BB4_2:
	i32.const push, 2
	set_local 7, pop
	i32.store (get_local 2), (get_local 7)
	return (get_local 4)
func_end4:
	.size	triangle, func_end4-triangle

	.globl	diamond
	.type	diamond,@function
diamond:
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32, i32, i32, i32, i32, i32
	block $BB5_3
	block $BB5_2
	get_local push, 0
	set_local 2, pop
	get_local push, 1
	set_local 3, pop
	i32.const push, 0
	set_local 4, pop
	i32.store (get_local 2), (get_local 4)
	i32.ne push, (get_local 3), (get_local 4)
	set_local 5, pop
	br_if $BB5_2, (get_local 5)
	i32.const push, 1
	set_local 7, pop
	i32.store (get_local 2), (get_local 7)
	br $BB5_3
BB5_2:
	i32.const push, 2
	set_local 6, pop
	i32.store (get_local 2), (get_local 6)
BB5_3:
	i32.const push, 3
	set_local 8, pop
	i32.store (get_local 2), (get_local 8)
	return (get_local 4)
func_end5:
	.size	diamond, func_end5-diamond

	.globl	single_block
	.type	single_block,@function
single_block:
	.param i32
	.result i32
	.local i32, i32
	get_local push, 0
	set_local 1, pop
	i32.const push, 0
	set_local 2, pop
	i32.store (get_local 1), (get_local 2)
	return (get_local 2)
func_end6:
	.size	single_block, func_end6-single_block

	.globl	minimal_loop
	.type	minimal_loop,@function
minimal_loop:
	.param i32
	.result i32
	.local i32, i32, i32
	get_local push, 0
	set_local 1, pop
	i32.const push, 0
	set_local 2, pop
	i32.store (get_local 1), (get_local 2)
	i32.const push, 1
	set_local 3, pop
BB7_1:
	loop $BB7_2
	i32.store (get_local 1), (get_local 3)
	br $BB7_1
func_end7:
	.size	minimal_loop, func_end7-minimal_loop

	.globl	simple_loop
	.type	simple_loop,@function
simple_loop:
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32, i32, i32, i32, i32, i32
	get_local push, 1
	set_local 3, pop
	get_local push, 0
	set_local 2, pop
	i32.const push, 0
	set_local 4, pop
	i32.store (get_local 2), (get_local 4)
	i32.eq push, (get_local 3), (get_local 4)
	set_local 6, pop
	i32.const push, 1
	set_local 7, pop
BB8_1:
	loop $BB8_2
	i32.store (get_local 2), (get_local 7)
	br_if $BB8_1, (get_local 6)
	i32.const push, 2
	set_local 8, pop
	i32.store (get_local 2), (get_local 8)
	return (get_local 4)
func_end8:
	.size	simple_loop, func_end8-simple_loop

	.globl	doubletriangle
	.type	doubletriangle,@function
doubletriangle:
	.param i32
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32
	block $BB9_4
	block $BB9_3
	get_local push, 2
	set_local 4, pop
	get_local push, 0
	set_local 5, pop
	i32.const push, 0
	set_local 6, pop
	i32.store (get_local 4), (get_local 6)
	i32.ne push, (get_local 5), (get_local 6)
	set_local 7, pop
	br_if $BB9_4, (get_local 7)
	get_local push, 1
	set_local 3, pop
	i32.const push, 2
	set_local 8, pop
	i32.store (get_local 4), (get_local 8)
	i32.ne push, (get_local 3), (get_local 6)
	set_local 10, pop
	br_if $BB9_3, (get_local 10)
	i32.const push, 3
	set_local 11, pop
	i32.store (get_local 4), (get_local 11)
BB9_3:
	i32.const push, 4
	set_local 12, pop
	i32.store (get_local 4), (get_local 12)
BB9_4:
	i32.const push, 5
	set_local 13, pop
	i32.store (get_local 4), (get_local 13)
	return (get_local 6)
func_end9:
	.size	doubletriangle, func_end9-doubletriangle

	.globl	ifelse_earlyexits
	.type	ifelse_earlyexits,@function
ifelse_earlyexits:
	.param i32
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32
	block $BB10_4
	block $BB10_2
	get_local push, 2
	set_local 4, pop
	get_local push, 0
	set_local 5, pop
	i32.const push, 0
	set_local 6, pop
	i32.store (get_local 4), (get_local 6)
	i32.ne push, (get_local 5), (get_local 6)
	set_local 7, pop
	br_if $BB10_2, (get_local 7)
	i32.const push, 1
	set_local 12, pop
	i32.store (get_local 4), (get_local 12)
	br $BB10_4
BB10_2:
	get_local push, 1
	set_local 3, pop
	i32.const push, 2
	set_local 8, pop
	i32.store (get_local 4), (get_local 8)
	i32.ne push, (get_local 3), (get_local 6)
	set_local 10, pop
	br_if $BB10_4, (get_local 10)
	i32.const push, 3
	set_local 11, pop
	i32.store (get_local 4), (get_local 11)
BB10_4:
	i32.const push, 4
	set_local 13, pop
	i32.store (get_local 4), (get_local 13)
	return (get_local 6)
func_end10:
	.size	ifelse_earlyexits, func_end10-ifelse_earlyexits

	.globl	test3
	.type	test3,@function
test3:
	.param i32
	.local i32, i32, i32, i32, i32, i32, i32
	block $BB11_1
	get_local push, 0
	set_local 1, pop
	i32.const push, 0
	set_local 2, pop
	br_if $BB11_1, (get_local 2)
	br $BB11_2
BB11_1:
	return
BB11_2:
	loop $BB11_5
	block $BB11_4
	block $BB11_2
	i32.eq push, (get_local 5), (get_local 2)
	set_local 4, pop
BB11_3:
	loop $BB11_4
	i32.eq push, (get_local 7), (get_local 1)
	set_local 6, pop
	br_if $BB11_4, (get_local 6)
	br $BB11_3
BB11_4:
	call $bar
	br $BB11_2
func_end11:
	.size	test3, func_end11-test3


	.imports
	.import $something "" "something" (param)
	.import $bar "" "bar" (param)
