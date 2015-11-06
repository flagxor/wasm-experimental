;; This file was generated by wasmate.py, which is a script that converts
;; from the "flat" text assembly syntax emitted by LLVM into the s-expression
;; syntax expected by the spec repository.
;;
;; Note: this is a hack. A real toolchain will eventually be needed.
;;

(module
  (import $i32_nullary "" "i32_nullary" (param) (result i32))
  (import $i32_unary "" "i32_unary" (param i32) (result i32))
  (import $i32_binary "" "i32_binary" (param i32 i32) (result i32))
  (import $i64_nullary "" "i64_nullary" (param) (result i64))
  (import $float_nullary "" "float_nullary" (param) (result f32))
  (import $double_nullary "" "double_nullary" (param) (result f64))
  (import $void_nullary "" "void_nullary" (param))
  (export "call_i32_nullary" $call_i32_nullary)
  (func $call_i32_nullary
    (result i32)
    (local i32)
    (set_local 0 (call_import $i32_nullary))
    (return (get_local 0))
  )
  (export "call_i64_nullary" $call_i64_nullary)
  (func $call_i64_nullary
    (result i64)
    (local i64)
    (set_local 0 (call_import $i64_nullary))
    (return (get_local 0))
  )
  (export "call_float_nullary" $call_float_nullary)
  (func $call_float_nullary
    (result f32)
    (local f32)
    (set_local 0 (call_import $float_nullary))
    (return (get_local 0))
  )
  (export "call_double_nullary" $call_double_nullary)
  (func $call_double_nullary
    (result f64)
    (local f64)
    (set_local 0 (call_import $double_nullary))
    (return (get_local 0))
  )
  (export "call_void_nullary" $call_void_nullary)
  (func $call_void_nullary
    (call_import $void_nullary)
    (return)
  )
  (export "call_i32_unary" $call_i32_unary)
  (func $call_i32_unary
    (param i32)
    (result i32)
    (local i32 i32)
    (set_local 1 (get_local 0))
    (set_local 2 (call_import $i32_unary (get_local 1)))
    (return (get_local 2))
  )
  (export "call_i32_binary" $call_i32_binary)
  (func $call_i32_binary
    (param i32)
    (param i32)
    (result i32)
    (local i32 i32 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (call_import $i32_binary (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "call_indirect_void" $call_indirect_void)
  (func $call_indirect_void
    (param i32)
    (local i32)
    (set_local 1 (get_local 0))
    (call_indirect (get_local 1))
    (return)
  )
  (export "call_indirect_i32" $call_indirect_i32)
  (func $call_indirect_i32
    (param i32)
    (result i32)
    (local i32 i32)
    (set_local 1 (get_local 0))
    (set_local 2 (call_indirect (get_local 1)))
    (return (get_local 2))
  )
  (export "tail_call_void_nullary" $tail_call_void_nullary)
  (func $tail_call_void_nullary
    (call_import $void_nullary)
    (return)
  )
  (export "fastcc_tail_call_void_nullary" $fastcc_tail_call_void_nullary)
  (func $fastcc_tail_call_void_nullary
    (call_import $void_nullary)
    (return)
  )
  (export "coldcc_tail_call_void_nullary" $coldcc_tail_call_void_nullary)
  (func $coldcc_tail_call_void_nullary
    (call_import $void_nullary)
    (return)
  )
  (memory 0 0
    (segment 0
      ""
    )
  )
)
