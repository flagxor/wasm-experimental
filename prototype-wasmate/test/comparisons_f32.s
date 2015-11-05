	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/comparisons_f32.ll"
	.globl	ord_f32
	.type	ord_f32,@function
ord_f32:
	.param f32
	.param f32
	.result i32
	.local f32, f32, i32, i32, i32
	get_local push, 0
	set_local 2, pop
	get_local push, 1
	set_local 3, pop
	f32.eq push, (get_local 3), (get_local 3)
	set_local 4, pop
	f32.eq push, (get_local 2), (get_local 2)
	set_local 5, pop
	i32.and push, (get_local 5), (get_local 4)
	set_local 6, pop
	return (get_local 6)
func_end0:
	.size	ord_f32, func_end0-ord_f32

	.globl	uno_f32
	.type	uno_f32,@function
uno_f32:
	.param f32
	.param f32
	.result i32
	.local f32, f32, i32, i32, i32
	get_local push, 0
	set_local 2, pop
	get_local push, 1
	set_local 3, pop
	f32.ne push, (get_local 3), (get_local 3)
	set_local 4, pop
	f32.ne push, (get_local 2), (get_local 2)
	set_local 5, pop
	i32.or push, (get_local 5), (get_local 4)
	set_local 6, pop
	return (get_local 6)
func_end1:
	.size	uno_f32, func_end1-uno_f32

	.globl	oeq_f32
	.type	oeq_f32,@function
oeq_f32:
	.param f32
	.param f32
	.result i32
	.local f32, f32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f32.eq push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end2:
	.size	oeq_f32, func_end2-oeq_f32

	.globl	une_f32
	.type	une_f32,@function
une_f32:
	.param f32
	.param f32
	.result i32
	.local f32, f32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f32.ne push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end3:
	.size	une_f32, func_end3-une_f32

	.globl	olt_f32
	.type	olt_f32,@function
olt_f32:
	.param f32
	.param f32
	.result i32
	.local f32, f32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f32.lt push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end4:
	.size	olt_f32, func_end4-olt_f32

	.globl	ole_f32
	.type	ole_f32,@function
ole_f32:
	.param f32
	.param f32
	.result i32
	.local f32, f32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f32.le push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end5:
	.size	ole_f32, func_end5-ole_f32

	.globl	ogt_f32
	.type	ogt_f32,@function
ogt_f32:
	.param f32
	.param f32
	.result i32
	.local f32, f32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f32.gt push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end6:
	.size	ogt_f32, func_end6-ogt_f32

	.globl	oge_f32
	.type	oge_f32,@function
oge_f32:
	.param f32
	.param f32
	.result i32
	.local f32, f32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f32.ge push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end7:
	.size	oge_f32, func_end7-oge_f32

	.globl	ueq_f32
	.type	ueq_f32,@function
ueq_f32:
	.param f32
	.param f32
	.result i32
	.local f32, f32, i32, i32, i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f32.eq push, (get_local 3), (get_local 2)
	set_local 4, pop
	f32.ne push, (get_local 2), (get_local 2)
	set_local 5, pop
	f32.ne push, (get_local 3), (get_local 3)
	set_local 6, pop
	i32.or push, (get_local 6), (get_local 5)
	set_local 7, pop
	i32.or push, (get_local 4), (get_local 7)
	set_local 8, pop
	return (get_local 8)
func_end8:
	.size	ueq_f32, func_end8-ueq_f32

	.globl	one_f32
	.type	one_f32,@function
one_f32:
	.param f32
	.param f32
	.result i32
	.local f32, f32, i32, i32, i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f32.ne push, (get_local 3), (get_local 2)
	set_local 4, pop
	f32.eq push, (get_local 2), (get_local 2)
	set_local 5, pop
	f32.eq push, (get_local 3), (get_local 3)
	set_local 6, pop
	i32.and push, (get_local 6), (get_local 5)
	set_local 7, pop
	i32.and push, (get_local 4), (get_local 7)
	set_local 8, pop
	return (get_local 8)
func_end9:
	.size	one_f32, func_end9-one_f32

	.globl	ult_f32
	.type	ult_f32,@function
ult_f32:
	.param f32
	.param f32
	.result i32
	.local f32, f32, i32, i32, i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f32.lt push, (get_local 3), (get_local 2)
	set_local 4, pop
	f32.ne push, (get_local 2), (get_local 2)
	set_local 5, pop
	f32.ne push, (get_local 3), (get_local 3)
	set_local 6, pop
	i32.or push, (get_local 6), (get_local 5)
	set_local 7, pop
	i32.or push, (get_local 4), (get_local 7)
	set_local 8, pop
	return (get_local 8)
func_end10:
	.size	ult_f32, func_end10-ult_f32

	.globl	ule_f32
	.type	ule_f32,@function
ule_f32:
	.param f32
	.param f32
	.result i32
	.local f32, f32, i32, i32, i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f32.le push, (get_local 3), (get_local 2)
	set_local 4, pop
	f32.ne push, (get_local 2), (get_local 2)
	set_local 5, pop
	f32.ne push, (get_local 3), (get_local 3)
	set_local 6, pop
	i32.or push, (get_local 6), (get_local 5)
	set_local 7, pop
	i32.or push, (get_local 4), (get_local 7)
	set_local 8, pop
	return (get_local 8)
func_end11:
	.size	ule_f32, func_end11-ule_f32

	.globl	ugt_f32
	.type	ugt_f32,@function
ugt_f32:
	.param f32
	.param f32
	.result i32
	.local f32, f32, i32, i32, i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f32.gt push, (get_local 3), (get_local 2)
	set_local 4, pop
	f32.ne push, (get_local 2), (get_local 2)
	set_local 5, pop
	f32.ne push, (get_local 3), (get_local 3)
	set_local 6, pop
	i32.or push, (get_local 6), (get_local 5)
	set_local 7, pop
	i32.or push, (get_local 4), (get_local 7)
	set_local 8, pop
	return (get_local 8)
func_end12:
	.size	ugt_f32, func_end12-ugt_f32

	.globl	uge_f32
	.type	uge_f32,@function
uge_f32:
	.param f32
	.param f32
	.result i32
	.local f32, f32, i32, i32, i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f32.ge push, (get_local 3), (get_local 2)
	set_local 4, pop
	f32.ne push, (get_local 2), (get_local 2)
	set_local 5, pop
	f32.ne push, (get_local 3), (get_local 3)
	set_local 6, pop
	i32.or push, (get_local 6), (get_local 5)
	set_local 7, pop
	i32.or push, (get_local 4), (get_local 7)
	set_local 8, pop
	return (get_local 8)
func_end13:
	.size	uge_f32, func_end13-uge_f32



