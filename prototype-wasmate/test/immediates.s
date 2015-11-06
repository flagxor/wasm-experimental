	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/immediates.ll"
	.globl	zero_i32
	.type	zero_i32,@function
zero_i32:
	.result i32
	.local i32
	i32.const push, 0
	set_local 0, pop
	return (get_local 0)
func_end0:
	.size	zero_i32, func_end0-zero_i32

	.globl	one_i32
	.type	one_i32,@function
one_i32:
	.result i32
	.local i32
	i32.const push, 1
	set_local 0, pop
	return (get_local 0)
func_end1:
	.size	one_i32, func_end1-one_i32

	.globl	max_i32
	.type	max_i32,@function
max_i32:
	.result i32
	.local i32
	i32.const push, 2147483647
	set_local 0, pop
	return (get_local 0)
func_end2:
	.size	max_i32, func_end2-max_i32

	.globl	min_i32
	.type	min_i32,@function
min_i32:
	.result i32
	.local i32
	i32.const push, -2147483648
	set_local 0, pop
	return (get_local 0)
func_end3:
	.size	min_i32, func_end3-min_i32

	.globl	zero_i64
	.type	zero_i64,@function
zero_i64:
	.result i64
	.local i64
	i64.const push, 0
	set_local 0, pop
	return (get_local 0)
func_end4:
	.size	zero_i64, func_end4-zero_i64

	.globl	one_i64
	.type	one_i64,@function
one_i64:
	.result i64
	.local i64
	i64.const push, 1
	set_local 0, pop
	return (get_local 0)
func_end5:
	.size	one_i64, func_end5-one_i64

	.globl	max_i64
	.type	max_i64,@function
max_i64:
	.result i64
	.local i64
	i64.const push, 9223372036854775807
	set_local 0, pop
	return (get_local 0)
func_end6:
	.size	max_i64, func_end6-max_i64

	.globl	min_i64
	.type	min_i64,@function
min_i64:
	.result i64
	.local i64
	i64.const push, -9223372036854775808
	set_local 0, pop
	return (get_local 0)
func_end7:
	.size	min_i64, func_end7-min_i64

	.globl	negzero_f32
	.type	negzero_f32,@function
negzero_f32:
	.result f32
	.local f32
	f32.const push, -0x0p0
	set_local 0, pop
	return (get_local 0)
func_end8:
	.size	negzero_f32, func_end8-negzero_f32

	.globl	zero_f32
	.type	zero_f32,@function
zero_f32:
	.result f32
	.local f32
	f32.const push, 0x0p0
	set_local 0, pop
	return (get_local 0)
func_end9:
	.size	zero_f32, func_end9-zero_f32

	.globl	one_f32
	.type	one_f32,@function
one_f32:
	.result f32
	.local f32
	f32.const push, 0x1p0
	set_local 0, pop
	return (get_local 0)
func_end10:
	.size	one_f32, func_end10-one_f32

	.globl	two_f32
	.type	two_f32,@function
two_f32:
	.result f32
	.local f32
	f32.const push, 0x1p1
	set_local 0, pop
	return (get_local 0)
func_end11:
	.size	two_f32, func_end11-two_f32

	.globl	nan_f32
	.type	nan_f32,@function
nan_f32:
	.result f32
	.local f32
	f32.const push, nan
	set_local 0, pop
	return (get_local 0)
func_end12:
	.size	nan_f32, func_end12-nan_f32

	.globl	negnan_f32
	.type	negnan_f32,@function
negnan_f32:
	.result f32
	.local f32
	f32.const push, -nan
	set_local 0, pop
	return (get_local 0)
func_end13:
	.size	negnan_f32, func_end13-negnan_f32

	.globl	inf_f32
	.type	inf_f32,@function
inf_f32:
	.result f32
	.local f32
	f32.const push, infinity
	set_local 0, pop
	return (get_local 0)
func_end14:
	.size	inf_f32, func_end14-inf_f32

	.globl	neginf_f32
	.type	neginf_f32,@function
neginf_f32:
	.result f32
	.local f32
	f32.const push, -infinity
	set_local 0, pop
	return (get_local 0)
func_end15:
	.size	neginf_f32, func_end15-neginf_f32

	.globl	negzero_f64
	.type	negzero_f64,@function
negzero_f64:
	.result f64
	.local f64
	f64.const push, -0x0p0
	set_local 0, pop
	return (get_local 0)
func_end16:
	.size	negzero_f64, func_end16-negzero_f64

	.globl	zero_f64
	.type	zero_f64,@function
zero_f64:
	.result f64
	.local f64
	f64.const push, 0x0p0
	set_local 0, pop
	return (get_local 0)
func_end17:
	.size	zero_f64, func_end17-zero_f64

	.globl	one_f64
	.type	one_f64,@function
one_f64:
	.result f64
	.local f64
	f64.const push, 0x1p0
	set_local 0, pop
	return (get_local 0)
func_end18:
	.size	one_f64, func_end18-one_f64

	.globl	two_f64
	.type	two_f64,@function
two_f64:
	.result f64
	.local f64
	f64.const push, 0x1p1
	set_local 0, pop
	return (get_local 0)
func_end19:
	.size	two_f64, func_end19-two_f64

	.globl	nan_f64
	.type	nan_f64,@function
nan_f64:
	.result f64
	.local f64
	f64.const push, nan
	set_local 0, pop
	return (get_local 0)
func_end20:
	.size	nan_f64, func_end20-nan_f64

	.globl	negnan_f64
	.type	negnan_f64,@function
negnan_f64:
	.result f64
	.local f64
	f64.const push, -nan
	set_local 0, pop
	return (get_local 0)
func_end21:
	.size	negnan_f64, func_end21-negnan_f64

	.globl	inf_f64
	.type	inf_f64,@function
inf_f64:
	.result f64
	.local f64
	f64.const push, infinity
	set_local 0, pop
	return (get_local 0)
func_end22:
	.size	inf_f64, func_end22-inf_f64

	.globl	neginf_f64
	.type	neginf_f64,@function
neginf_f64:
	.result f64
	.local f64
	f64.const push, -infinity
	set_local 0, pop
	return (get_local 0)
func_end23:
	.size	neginf_f64, func_end23-neginf_f64



