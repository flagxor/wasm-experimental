	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/memory-addr32.ll"
	.globl	page_size
	.type	page_size,@function
page_size:
	.result i32
	.local i32
	i32.page_size
	set_local 0, pop
	return (get_local 0)
func_end0:
	.size	page_size, func_end0-page_size

	.globl	memory_size
	.type	memory_size,@function
memory_size:
	.result i32
	.local i32
	i32.memory_size
	set_local 0, pop
	return (get_local 0)
func_end1:
	.size	memory_size, func_end1-memory_size

	.globl	resize_memory
	.type	resize_memory,@function
resize_memory:
	.param i32
	.local i32
	get_local 0
	set_local 1, pop
	i32.resize_memory (get_local 1)
	return
func_end2:
	.size	resize_memory, func_end2-resize_memory



