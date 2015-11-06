	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/call.ll"
	.globl	call_i32_nullary
	.type	call_i32_nullary,@function
call_i32_nullary:
	.result i32
	.local i32
	call $i32_nullary, push
	set_local 0, pop
	return (get_local 0)
func_end0:
	.size	call_i32_nullary, func_end0-call_i32_nullary

	.globl	call_i64_nullary
	.type	call_i64_nullary,@function
call_i64_nullary:
	.result i64
	.local i64
	call $i64_nullary, push
	set_local 0, pop
	return (get_local 0)
func_end1:
	.size	call_i64_nullary, func_end1-call_i64_nullary

	.globl	call_float_nullary
	.type	call_float_nullary,@function
call_float_nullary:
	.result f32
	.local f32
	call $float_nullary, push
	set_local 0, pop
	return (get_local 0)
func_end2:
	.size	call_float_nullary, func_end2-call_float_nullary

	.globl	call_double_nullary
	.type	call_double_nullary,@function
call_double_nullary:
	.result f64
	.local f64
	call $double_nullary, push
	set_local 0, pop
	return (get_local 0)
func_end3:
	.size	call_double_nullary, func_end3-call_double_nullary

	.globl	call_void_nullary
	.type	call_void_nullary,@function
call_void_nullary:
	call $void_nullary
	return
func_end4:
	.size	call_void_nullary, func_end4-call_void_nullary

	.globl	call_i32_unary
	.type	call_i32_unary,@function
call_i32_unary:
	.param i32
	.result i32
	.local i32, i32
	get_local push, 0
	set_local 1, pop
	call $i32_unary, push, (get_local 1)
	set_local 2, pop
	return (get_local 2)
func_end5:
	.size	call_i32_unary, func_end5-call_i32_unary

	.globl	call_i32_binary
	.type	call_i32_binary,@function
call_i32_binary:
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	call $i32_binary, push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end6:
	.size	call_i32_binary, func_end6-call_i32_binary

	.globl	call_indirect_void
	.type	call_indirect_void,@function
call_indirect_void:
	.param i32
	.local i32
	get_local push, 0
	set_local 1, pop
	void.call_indirect (get_local 1)
	return
func_end7:
	.size	call_indirect_void, func_end7-call_indirect_void

	.globl	call_indirect_i32
	.type	call_indirect_i32,@function
call_indirect_i32:
	.param i32
	.result i32
	.local i32, i32
	get_local push, 0
	set_local 1, pop
	i32.call_indirect (get_local 1), push
	set_local 2, pop
	return (get_local 2)
func_end8:
	.size	call_indirect_i32, func_end8-call_indirect_i32

	.globl	tail_call_void_nullary
	.type	tail_call_void_nullary,@function
tail_call_void_nullary:
	call $void_nullary
	return
func_end9:
	.size	tail_call_void_nullary, func_end9-tail_call_void_nullary

	.globl	fastcc_tail_call_void_nullary
	.type	fastcc_tail_call_void_nullary,@function
fastcc_tail_call_void_nullary:
	call $void_nullary
	return
func_end10:
	.size	fastcc_tail_call_void_nullary, func_end10-fastcc_tail_call_void_nullary

	.globl	coldcc_tail_call_void_nullary
	.type	coldcc_tail_call_void_nullary,@function
coldcc_tail_call_void_nullary:
	call $void_nullary
	return
func_end11:
	.size	coldcc_tail_call_void_nullary, func_end11-coldcc_tail_call_void_nullary


	.imports
	.import $i32_nullary "" "i32_nullary" (param) (result i32)
	.import $i32_unary "" "i32_unary" (param i32) (result i32)
	.import $i32_binary "" "i32_binary" (param i32 i32) (result i32)
	.import $i64_nullary "" "i64_nullary" (param) (result i64)
	.import $float_nullary "" "float_nullary" (param) (result f32)
	.import $double_nullary "" "double_nullary" (param) (result f64)
	.import $void_nullary "" "void_nullary" (param)
