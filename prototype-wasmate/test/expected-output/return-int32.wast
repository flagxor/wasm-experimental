;; This file was generated by wasmate.py, which is a script that converts
;; from the "flat" text assembly syntax emitted by LLVM into the s-expression
;; syntax expected by the spec repository.
;;
;; Note: this is a hack. A real toolchain will eventually be needed.
;;

(module
  (export "return_i32" $return_i32)
  (func $return_i32
    (param i32)
    (result i32)
    (local i32)
    (set_local 1 (get_local 0))
    (return (get_local 1))
  )
  (memory 0 0
    (segment 0
      ""
    )
  )
)
