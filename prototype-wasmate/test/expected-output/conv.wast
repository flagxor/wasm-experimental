;; This file was generated by wasmate.py, which is a script that converts
;; from the "flat" text assembly syntax emitted by LLVM into the s-expression
;; syntax expected by the spec repository.
;;
;; Note: this is a hack. A real toolchain will eventually be needed.
;;

(module
  (export "i32_wrap_i64" $i32_wrap_i64)
  (func $i32_wrap_i64
    (param i64)
    (result i32)
    (local i64 i32)
    (set_local 1 (get_local 0))
    (set_local 2 (i32.wrap/i64 (get_local 1)))
    (return (get_local 2))
  )
  (export "i64_extend_s_i32" $i64_extend_s_i32)
  (func $i64_extend_s_i32
    (param i32)
    (result i64)
    (local i32 i64)
    (set_local 1 (get_local 0))
    (set_local 2 (i64.extend_s/i32 (get_local 1)))
    (return (get_local 2))
  )
  (export "i64_extend_u_i32" $i64_extend_u_i32)
  (func $i64_extend_u_i32
    (param i32)
    (result i64)
    (local i32 i64)
    (set_local 1 (get_local 0))
    (set_local 2 (i64.extend_u/i32 (get_local 1)))
    (return (get_local 2))
  )
  (export "i32_trunc_s_f32" $i32_trunc_s_f32)
  (func $i32_trunc_s_f32
    (param f32)
    (result i32)
    (local f32 i32)
    (set_local 1 (get_local 0))
    (set_local 2 (i32.trunc_s/f32 (get_local 1)))
    (return (get_local 2))
  )
  (export "i32_trunc_u_f32" $i32_trunc_u_f32)
  (func $i32_trunc_u_f32
    (param f32)
    (result i32)
    (local f32 i32)
    (set_local 1 (get_local 0))
    (set_local 2 (i32.trunc_u/f32 (get_local 1)))
    (return (get_local 2))
  )
  (export "i32_trunc_s_f64" $i32_trunc_s_f64)
  (func $i32_trunc_s_f64
    (param f64)
    (result i32)
    (local f64 i32)
    (set_local 1 (get_local 0))
    (set_local 2 (i32.trunc_s/f64 (get_local 1)))
    (return (get_local 2))
  )
  (export "i32_trunc_u_f64" $i32_trunc_u_f64)
  (func $i32_trunc_u_f64
    (param f64)
    (result i32)
    (local f64 i32)
    (set_local 1 (get_local 0))
    (set_local 2 (i32.trunc_u/f64 (get_local 1)))
    (return (get_local 2))
  )
  (export "i64_trunc_s_f32" $i64_trunc_s_f32)
  (func $i64_trunc_s_f32
    (param f32)
    (result i64)
    (local f32 i64)
    (set_local 1 (get_local 0))
    (set_local 2 (i64.trunc_s/f32 (get_local 1)))
    (return (get_local 2))
  )
  (export "i64_trunc_u_f32" $i64_trunc_u_f32)
  (func $i64_trunc_u_f32
    (param f32)
    (result i64)
    (local f32 i64)
    (set_local 1 (get_local 0))
    (set_local 2 (i64.trunc_u/f32 (get_local 1)))
    (return (get_local 2))
  )
  (export "i64_trunc_s_f64" $i64_trunc_s_f64)
  (func $i64_trunc_s_f64
    (param f64)
    (result i64)
    (local f64 i64)
    (set_local 1 (get_local 0))
    (set_local 2 (i64.trunc_s/f64 (get_local 1)))
    (return (get_local 2))
  )
  (export "i64_trunc_u_f64" $i64_trunc_u_f64)
  (func $i64_trunc_u_f64
    (param f64)
    (result i64)
    (local f64 i64)
    (set_local 1 (get_local 0))
    (set_local 2 (i64.trunc_u/f64 (get_local 1)))
    (return (get_local 2))
  )
  (export "f32_convert_s_i32" $f32_convert_s_i32)
  (func $f32_convert_s_i32
    (param i32)
    (result f32)
    (local i32 f32)
    (set_local 1 (get_local 0))
    (set_local 2 (f32.convert_s/i32 (get_local 1)))
    (return (get_local 2))
  )
  (export "f32_convert_u_i32" $f32_convert_u_i32)
  (func $f32_convert_u_i32
    (param i32)
    (result f32)
    (local i32 f32)
    (set_local 1 (get_local 0))
    (set_local 2 (f32.convert_u/i32 (get_local 1)))
    (return (get_local 2))
  )
  (export "f64_convert_s_i32" $f64_convert_s_i32)
  (func $f64_convert_s_i32
    (param i32)
    (result f64)
    (local i32 f64)
    (set_local 1 (get_local 0))
    (set_local 2 (f64.convert_s/i32 (get_local 1)))
    (return (get_local 2))
  )
  (export "f64_convert_u_i32" $f64_convert_u_i32)
  (func $f64_convert_u_i32
    (param i32)
    (result f64)
    (local i32 f64)
    (set_local 1 (get_local 0))
    (set_local 2 (f64.convert_u/i32 (get_local 1)))
    (return (get_local 2))
  )
  (export "f32_convert_s_i64" $f32_convert_s_i64)
  (func $f32_convert_s_i64
    (param i64)
    (result f32)
    (local i64 f32)
    (set_local 1 (get_local 0))
    (set_local 2 (f32.convert_s/i64 (get_local 1)))
    (return (get_local 2))
  )
  (export "f32_convert_u_i64" $f32_convert_u_i64)
  (func $f32_convert_u_i64
    (param i64)
    (result f32)
    (local i64 f32)
    (set_local 1 (get_local 0))
    (set_local 2 (f32.convert_u/i64 (get_local 1)))
    (return (get_local 2))
  )
  (export "f64_convert_s_i64" $f64_convert_s_i64)
  (func $f64_convert_s_i64
    (param i64)
    (result f64)
    (local i64 f64)
    (set_local 1 (get_local 0))
    (set_local 2 (f64.convert_s/i64 (get_local 1)))
    (return (get_local 2))
  )
  (export "f64_convert_u_i64" $f64_convert_u_i64)
  (func $f64_convert_u_i64
    (param i64)
    (result f64)
    (local i64 f64)
    (set_local 1 (get_local 0))
    (set_local 2 (f64.convert_u/i64 (get_local 1)))
    (return (get_local 2))
  )
  (export "f64_promote_f32" $f64_promote_f32)
  (func $f64_promote_f32
    (param f32)
    (result f64)
    (local f32 f64)
    (set_local 1 (get_local 0))
    (set_local 2 (f64.promote/f32 (get_local 1)))
    (return (get_local 2))
  )
  (export "f32_demote_f64" $f32_demote_f64)
  (func $f32_demote_f64
    (param f64)
    (result f32)
    (local f64 f32)
    (set_local 1 (get_local 0))
    (set_local 2 (f32.demote/f64 (get_local 1)))
    (return (get_local 2))
  )
  (memory 0 0
    (segment 0
      ""
    )
  )
)
