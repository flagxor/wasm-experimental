;; This file was generated by wasmate.py, which is a script that converts
;; from the "flat" text assembly syntax emitted by LLVM into the s-expression
;; syntax expected by the spec repository.
;;
;; Note: this is a hack. A real toolchain will eventually be needed.
;;

(module
  (export "immediate_f32" $immediate_f32)
  (func $immediate_f32
    (result f32)
    (local f32)
    (set_local 0 (f32.const 0x1.4p1))
    (return (get_local 0))
  )
  (export "immediate_f64" $immediate_f64)
  (func $immediate_f64
    (result f64)
    (local f64)
    (set_local 0 (f64.const 0x1.4p1))
    (return (get_local 0))
  )
  (memory 0 0
    (segment 0
      ""
    )
  )
)
