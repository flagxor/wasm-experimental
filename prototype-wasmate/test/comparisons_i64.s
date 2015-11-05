	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/comparisons_i64.ll"
	.globl	eq_i64
	.type	eq_i64,@function
eq_i64:
	.param i64
	.param i64
	.result i32
	.local i64, i64, i32
	get_local 1
	set_local 2, pop
	get_local 0
	set_local 3, pop
	i64.eq (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end0:
	.size	eq_i64, func_end0-eq_i64

	.globl	ne_i64
	.type	ne_i64,@function
ne_i64:
	.param i64
	.param i64
	.result i32
	.local i64, i64, i32
	get_local 1
	set_local 2, pop
	get_local 0
	set_local 3, pop
	i64.ne (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end1:
	.size	ne_i64, func_end1-ne_i64

	.globl	slt_i64
	.type	slt_i64,@function
slt_i64:
	.param i64
	.param i64
	.result i32
	.local i64, i64, i32
	get_local 1
	set_local 2, pop
	get_local 0
	set_local 3, pop
	i64.lt_s (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end2:
	.size	slt_i64, func_end2-slt_i64

	.globl	sle_i64
	.type	sle_i64,@function
sle_i64:
	.param i64
	.param i64
	.result i32
	.local i64, i64, i32
	get_local 1
	set_local 2, pop
	get_local 0
	set_local 3, pop
	i64.le_s (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end3:
	.size	sle_i64, func_end3-sle_i64

	.globl	ult_i64
	.type	ult_i64,@function
ult_i64:
	.param i64
	.param i64
	.result i32
	.local i64, i64, i32
	get_local 1
	set_local 2, pop
	get_local 0
	set_local 3, pop
	i64.lt_u (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end4:
	.size	ult_i64, func_end4-ult_i64

	.globl	ule_i64
	.type	ule_i64,@function
ule_i64:
	.param i64
	.param i64
	.result i32
	.local i64, i64, i32
	get_local 1
	set_local 2, pop
	get_local 0
	set_local 3, pop
	i64.le_u (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end5:
	.size	ule_i64, func_end5-ule_i64

	.globl	sgt_i64
	.type	sgt_i64,@function
sgt_i64:
	.param i64
	.param i64
	.result i32
	.local i64, i64, i32
	get_local 1
	set_local 2, pop
	get_local 0
	set_local 3, pop
	i64.gt_s (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end6:
	.size	sgt_i64, func_end6-sgt_i64

	.globl	sge_i64
	.type	sge_i64,@function
sge_i64:
	.param i64
	.param i64
	.result i32
	.local i64, i64, i32
	get_local 1
	set_local 2, pop
	get_local 0
	set_local 3, pop
	i64.ge_s (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end7:
	.size	sge_i64, func_end7-sge_i64

	.globl	ugt_i64
	.type	ugt_i64,@function
ugt_i64:
	.param i64
	.param i64
	.result i32
	.local i64, i64, i32
	get_local 1
	set_local 2, pop
	get_local 0
	set_local 3, pop
	i64.gt_u (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end8:
	.size	ugt_i64, func_end8-ugt_i64

	.globl	uge_i64
	.type	uge_i64,@function
uge_i64:
	.param i64
	.param i64
	.result i32
	.local i64, i64, i32
	get_local 1
	set_local 2, pop
	get_local 0
	set_local 3, pop
	i64.ge_u (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end9:
	.size	uge_i64, func_end9-uge_i64



