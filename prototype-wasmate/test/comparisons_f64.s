	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/comparisons_f64.ll"
	.globl	ord_f64
	.type	ord_f64,@function
ord_f64:
	.param f64
	.param f64
	.result i32
	.local f64, f64, i32, i32, i32
	get_local push, 0
	set_local 2, pop
	get_local push, 1
	set_local 3, pop
	f64.eq push, (get_local 3), (get_local 3)
	set_local 4, pop
	f64.eq push, (get_local 2), (get_local 2)
	set_local 5, pop
	i32.and push, (get_local 5), (get_local 4)
	set_local 6, pop
	return (get_local 6)
func_end0:
	.size	ord_f64, func_end0-ord_f64

	.globl	uno_f64
	.type	uno_f64,@function
uno_f64:
	.param f64
	.param f64
	.result i32
	.local f64, f64, i32, i32, i32
	get_local push, 0
	set_local 2, pop
	get_local push, 1
	set_local 3, pop
	f64.ne push, (get_local 3), (get_local 3)
	set_local 4, pop
	f64.ne push, (get_local 2), (get_local 2)
	set_local 5, pop
	i32.or push, (get_local 5), (get_local 4)
	set_local 6, pop
	return (get_local 6)
func_end1:
	.size	uno_f64, func_end1-uno_f64

	.globl	oeq_f64
	.type	oeq_f64,@function
oeq_f64:
	.param f64
	.param f64
	.result i32
	.local f64, f64, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f64.eq push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end2:
	.size	oeq_f64, func_end2-oeq_f64

	.globl	une_f64
	.type	une_f64,@function
une_f64:
	.param f64
	.param f64
	.result i32
	.local f64, f64, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f64.ne push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end3:
	.size	une_f64, func_end3-une_f64

	.globl	olt_f64
	.type	olt_f64,@function
olt_f64:
	.param f64
	.param f64
	.result i32
	.local f64, f64, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f64.lt push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end4:
	.size	olt_f64, func_end4-olt_f64

	.globl	ole_f64
	.type	ole_f64,@function
ole_f64:
	.param f64
	.param f64
	.result i32
	.local f64, f64, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f64.le push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end5:
	.size	ole_f64, func_end5-ole_f64

	.globl	ogt_f64
	.type	ogt_f64,@function
ogt_f64:
	.param f64
	.param f64
	.result i32
	.local f64, f64, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f64.gt push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end6:
	.size	ogt_f64, func_end6-ogt_f64

	.globl	oge_f64
	.type	oge_f64,@function
oge_f64:
	.param f64
	.param f64
	.result i32
	.local f64, f64, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f64.ge push, (get_local 3), (get_local 2)
	set_local 4, pop
	return (get_local 4)
func_end7:
	.size	oge_f64, func_end7-oge_f64

	.globl	ueq_f64
	.type	ueq_f64,@function
ueq_f64:
	.param f64
	.param f64
	.result i32
	.local f64, f64, i32, i32, i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f64.eq push, (get_local 3), (get_local 2)
	set_local 4, pop
	f64.ne push, (get_local 2), (get_local 2)
	set_local 5, pop
	f64.ne push, (get_local 3), (get_local 3)
	set_local 6, pop
	i32.or push, (get_local 6), (get_local 5)
	set_local 7, pop
	i32.or push, (get_local 4), (get_local 7)
	set_local 8, pop
	return (get_local 8)
func_end8:
	.size	ueq_f64, func_end8-ueq_f64

	.globl	one_f64
	.type	one_f64,@function
one_f64:
	.param f64
	.param f64
	.result i32
	.local f64, f64, i32, i32, i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f64.ne push, (get_local 3), (get_local 2)
	set_local 4, pop
	f64.eq push, (get_local 2), (get_local 2)
	set_local 5, pop
	f64.eq push, (get_local 3), (get_local 3)
	set_local 6, pop
	i32.and push, (get_local 6), (get_local 5)
	set_local 7, pop
	i32.and push, (get_local 4), (get_local 7)
	set_local 8, pop
	return (get_local 8)
func_end9:
	.size	one_f64, func_end9-one_f64

	.globl	ult_f64
	.type	ult_f64,@function
ult_f64:
	.param f64
	.param f64
	.result i32
	.local f64, f64, i32, i32, i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f64.lt push, (get_local 3), (get_local 2)
	set_local 4, pop
	f64.ne push, (get_local 2), (get_local 2)
	set_local 5, pop
	f64.ne push, (get_local 3), (get_local 3)
	set_local 6, pop
	i32.or push, (get_local 6), (get_local 5)
	set_local 7, pop
	i32.or push, (get_local 4), (get_local 7)
	set_local 8, pop
	return (get_local 8)
func_end10:
	.size	ult_f64, func_end10-ult_f64

	.globl	ule_f64
	.type	ule_f64,@function
ule_f64:
	.param f64
	.param f64
	.result i32
	.local f64, f64, i32, i32, i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f64.le push, (get_local 3), (get_local 2)
	set_local 4, pop
	f64.ne push, (get_local 2), (get_local 2)
	set_local 5, pop
	f64.ne push, (get_local 3), (get_local 3)
	set_local 6, pop
	i32.or push, (get_local 6), (get_local 5)
	set_local 7, pop
	i32.or push, (get_local 4), (get_local 7)
	set_local 8, pop
	return (get_local 8)
func_end11:
	.size	ule_f64, func_end11-ule_f64

	.globl	ugt_f64
	.type	ugt_f64,@function
ugt_f64:
	.param f64
	.param f64
	.result i32
	.local f64, f64, i32, i32, i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f64.gt push, (get_local 3), (get_local 2)
	set_local 4, pop
	f64.ne push, (get_local 2), (get_local 2)
	set_local 5, pop
	f64.ne push, (get_local 3), (get_local 3)
	set_local 6, pop
	i32.or push, (get_local 6), (get_local 5)
	set_local 7, pop
	i32.or push, (get_local 4), (get_local 7)
	set_local 8, pop
	return (get_local 8)
func_end12:
	.size	ugt_f64, func_end12-ugt_f64

	.globl	uge_f64
	.type	uge_f64,@function
uge_f64:
	.param f64
	.param f64
	.result i32
	.local f64, f64, i32, i32, i32, i32, i32
	get_local push, 1
	set_local 2, pop
	get_local push, 0
	set_local 3, pop
	f64.ge push, (get_local 3), (get_local 2)
	set_local 4, pop
	f64.ne push, (get_local 2), (get_local 2)
	set_local 5, pop
	f64.ne push, (get_local 3), (get_local 3)
	set_local 6, pop
	i32.or push, (get_local 6), (get_local 5)
	set_local 7, pop
	i32.or push, (get_local 4), (get_local 7)
	set_local 8, pop
	return (get_local 8)
func_end13:
	.size	uge_f64, func_end13-uge_f64



