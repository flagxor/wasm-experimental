	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/comparisons_i32.ll"
	.globl	eq_i32
	.type	eq_i32,@function
eq_i32:
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i32.eq push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end0:
	.size	eq_i32, func_end0-eq_i32

	.globl	ne_i32
	.type	ne_i32,@function
ne_i32:
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i32.ne push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end1:
	.size	ne_i32, func_end1-ne_i32

	.globl	slt_i32
	.type	slt_i32,@function
slt_i32:
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i32.lt_s push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end2:
	.size	slt_i32, func_end2-slt_i32

	.globl	sle_i32
	.type	sle_i32,@function
sle_i32:
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i32.le_s push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end3:
	.size	sle_i32, func_end3-sle_i32

	.globl	ult_i32
	.type	ult_i32,@function
ult_i32:
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i32.lt_u push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end4:
	.size	ult_i32, func_end4-ult_i32

	.globl	ule_i32
	.type	ule_i32,@function
ule_i32:
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i32.le_u push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end5:
	.size	ule_i32, func_end5-ule_i32

	.globl	sgt_i32
	.type	sgt_i32,@function
sgt_i32:
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i32.gt_s push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end6:
	.size	sgt_i32, func_end6-sgt_i32

	.globl	sge_i32
	.type	sge_i32,@function
sge_i32:
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i32.ge_s push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end7:
	.size	sge_i32, func_end7-sge_i32

	.globl	ugt_i32
	.type	ugt_i32,@function
ugt_i32:
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i32.gt_u push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end8:
	.size	ugt_i32, func_end8-ugt_i32

	.globl	uge_i32
	.type	uge_i32,@function
uge_i32:
	.param i32
	.param i32
	.result i32
	.local i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	i32.ge_u push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end9:
	.size	uge_i32, func_end9-uge_i32



