	.text
	.file	"/usr/local/google/home/binji/dev/github/wasm-experimental/prototype-wasmate/third_party/llvm/test/CodeGen/WebAssembly/memory-addr32.ll"
	.globl	memory_size
	.type	memory_size,@function
memory_size:
	.result i32
	.local i32
	i32.memory_size
	set_local 0, pop
	return (get_local 0)
func_end0:
	.size	memory_size, func_end0-memory_size

	.globl	grow_memory
	.type	grow_memory,@function
grow_memory:
	.param i32
	.local i32
	get_local 0
	set_local 1, pop
	i32.grow_memory (get_local 1)
	return
func_end1:
	.size	grow_memory, func_end1-grow_memory



