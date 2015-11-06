	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/load-ext.ll"
	.globl	sext_i8_i32
	.type	sext_i8_i32,@function
sext_i8_i32:
	.param i32
	.result i32
	.local i32, i32
	get_local push, 0
	set_local 1, pop
	i32.load8_s push, (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end0:
	.size	sext_i8_i32, func_end0-sext_i8_i32

	.globl	zext_i8_i32
	.type	zext_i8_i32,@function
zext_i8_i32:
	.param i32
	.result i32
	.local i32, i32
	get_local push, 0
	set_local 1, pop
	i32.load8_u push, (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end1:
	.size	zext_i8_i32, func_end1-zext_i8_i32

	.globl	sext_i16_i32
	.type	sext_i16_i32,@function
sext_i16_i32:
	.param i32
	.result i32
	.local i32, i32
	get_local push, 0
	set_local 1, pop
	i32.load16_s push, (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end2:
	.size	sext_i16_i32, func_end2-sext_i16_i32

	.globl	zext_i16_i32
	.type	zext_i16_i32,@function
zext_i16_i32:
	.param i32
	.result i32
	.local i32, i32
	get_local push, 0
	set_local 1, pop
	i32.load16_u push, (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end3:
	.size	zext_i16_i32, func_end3-zext_i16_i32

	.globl	sext_i8_i64
	.type	sext_i8_i64,@function
sext_i8_i64:
	.param i32
	.result i64
	.local i32, i64
	get_local push, 0
	set_local 1, pop
	i64.load8_s push, (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end4:
	.size	sext_i8_i64, func_end4-sext_i8_i64

	.globl	zext_i8_i64
	.type	zext_i8_i64,@function
zext_i8_i64:
	.param i32
	.result i64
	.local i32, i64
	get_local push, 0
	set_local 1, pop
	i64.load8_u push, (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end5:
	.size	zext_i8_i64, func_end5-zext_i8_i64

	.globl	sext_i16_i64
	.type	sext_i16_i64,@function
sext_i16_i64:
	.param i32
	.result i64
	.local i32, i64
	get_local push, 0
	set_local 1, pop
	i64.load16_s push, (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end6:
	.size	sext_i16_i64, func_end6-sext_i16_i64

	.globl	zext_i16_i64
	.type	zext_i16_i64,@function
zext_i16_i64:
	.param i32
	.result i64
	.local i32, i64
	get_local push, 0
	set_local 1, pop
	i64.load16_u push, (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end7:
	.size	zext_i16_i64, func_end7-zext_i16_i64

	.globl	sext_i32_i64
	.type	sext_i32_i64,@function
sext_i32_i64:
	.param i32
	.result i64
	.local i32, i64
	get_local push, 0
	set_local 1, pop
	i64.load32_s push, (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end8:
	.size	sext_i32_i64, func_end8-sext_i32_i64

	.globl	zext_i32_i64
	.type	zext_i32_i64,@function
zext_i32_i64:
	.param i32
	.result i64
	.local i32, i64
	get_local push, 0
	set_local 1, pop
	i64.load32_u push, (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end9:
	.size	zext_i32_i64, func_end9-zext_i32_i64



