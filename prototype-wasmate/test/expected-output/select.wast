;; This file was generated by wasmate.py, which is a script that converts
;; from the "flat" text assembly syntax emitted by LLVM into the s-expression
;; syntax expected by the spec repository.
;;
;; Note: this is a hack. A real toolchain will eventually be needed.
;;

(module
  (export "select_i32" $select_i32)
  (func $select_i32
    (param i32)
    (param i32)
    (param i32)
    (result i32)
    (local i32 i32 i32 i32 i32 i32)
    (set_local 3 (get_local 1))
    (set_local 4 (get_local 0))
    (set_local 5 (get_local 2))
    (set_local 6 (i32.const 0))
    (set_local 7 (i32.eq (get_local 5) (get_local 6)))
    (set_local 8 (i32.select (get_local 7) (get_local 4) (get_local 3)))
    (return (get_local 8))
  )
  (export "select_i64" $select_i64)
  (func $select_i64
    (param i64)
    (param i64)
    (param i32)
    (result i64)
    (local i64 i64 i32 i32 i32 i64)
    (set_local 3 (get_local 1))
    (set_local 4 (get_local 0))
    (set_local 5 (get_local 2))
    (set_local 6 (i32.const 0))
    (set_local 7 (i32.eq (get_local 5) (get_local 6)))
    (set_local 8 (i64.select (get_local 7) (get_local 4) (get_local 3)))
    (return (get_local 8))
  )
  (export "select_f32" $select_f32)
  (func $select_f32
    (param f32)
    (param f32)
    (param i32)
    (result f32)
    (local f32 f32 i32 i32 i32 f32)
    (set_local 3 (get_local 1))
    (set_local 4 (get_local 0))
    (set_local 5 (get_local 2))
    (set_local 6 (i32.const 0))
    (set_local 7 (i32.eq (get_local 5) (get_local 6)))
    (set_local 8 (f32.select (get_local 7) (get_local 4) (get_local 3)))
    (return (get_local 8))
  )
  (export "select_f64" $select_f64)
  (func $select_f64
    (param f64)
    (param f64)
    (param i32)
    (result f64)
    (local f64 f64 i32 i32 i32 f64)
    (set_local 3 (get_local 1))
    (set_local 4 (get_local 0))
    (set_local 5 (get_local 2))
    (set_local 6 (i32.const 0))
    (set_local 7 (i32.eq (get_local 5) (get_local 6)))
    (set_local 8 (f64.select (get_local 7) (get_local 4) (get_local 3)))
    (return (get_local 8))
  )
  (memory 0 0
    (segment 0
      ""
    )
  )
)
