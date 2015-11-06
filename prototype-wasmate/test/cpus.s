	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/cpus.ll"
	.globl	f
	.type	f,@function
f:                                      # @f
	.param i32
	.result i32
	.local i32
# BB#0:
	get_local push, 0
	set_local 1, pop
	return (get_local 1)
func_end0:
	.size	f, func_end0-f



