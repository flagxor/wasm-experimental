;; This file was generated by wasmate.py, which is a script that converts
;; from the "flat" text assembly syntax emitted by LLVM into the s-expression
;; syntax expected by the spec repository.
;;
;; Note: this is a hack. A real toolchain will eventually be needed.
;;

(module
  (export "trunc_i8_i32" $trunc_i8_i32)
  (func $trunc_i8_i32
    (param i32)
    (param i32)
    (local i32 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (i32.store8 (get_local 3) (get_local 2))
    (return)
  )
  (export "trunc_i16_i32" $trunc_i16_i32)
  (func $trunc_i16_i32
    (param i32)
    (param i32)
    (local i32 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (i32.store16 (get_local 3) (get_local 2))
    (return)
  )
  (export "trunc_i8_i64" $trunc_i8_i64)
  (func $trunc_i8_i64
    (param i32)
    (param i64)
    (local i64 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (i64.store8 (get_local 3) (get_local 2))
    (return)
  )
  (export "trunc_i16_i64" $trunc_i16_i64)
  (func $trunc_i16_i64
    (param i32)
    (param i64)
    (local i64 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (i64.store16 (get_local 3) (get_local 2))
    (return)
  )
  (export "trunc_i32_i64" $trunc_i32_i64)
  (func $trunc_i32_i64
    (param i32)
    (param i64)
    (local i64 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (i64.store32 (get_local 3) (get_local 2))
    (return)
  )
  (memory 0 0
    (segment 0
      ""
    )
  )
)
