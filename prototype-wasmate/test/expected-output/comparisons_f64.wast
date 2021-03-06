;; This file was generated by wasmate.py, which is a script that converts
;; from the "flat" text assembly syntax emitted by LLVM into the s-expression
;; syntax expected by the spec repository.
;;
;; Note: this is a hack. A real toolchain will eventually be needed.
;;

(module
  (export "ord_f64" $ord_f64)
  (func $ord_f64
    (param f64)
    (param f64)
    (result i32)
    (local f64 f64 i32 i32 i32)
    (set_local 2 (get_local 0))
    (set_local 3 (get_local 1))
    (set_local 4 (f64.eq (get_local 3) (get_local 3)))
    (set_local 5 (f64.eq (get_local 2) (get_local 2)))
    (set_local 6 (i32.and (get_local 5) (get_local 4)))
    (return (get_local 6))
  )
  (export "uno_f64" $uno_f64)
  (func $uno_f64
    (param f64)
    (param f64)
    (result i32)
    (local f64 f64 i32 i32 i32)
    (set_local 2 (get_local 0))
    (set_local 3 (get_local 1))
    (set_local 4 (f64.ne (get_local 3) (get_local 3)))
    (set_local 5 (f64.ne (get_local 2) (get_local 2)))
    (set_local 6 (i32.or (get_local 5) (get_local 4)))
    (return (get_local 6))
  )
  (export "oeq_f64" $oeq_f64)
  (func $oeq_f64
    (param f64)
    (param f64)
    (result i32)
    (local f64 f64 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (f64.eq (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "une_f64" $une_f64)
  (func $une_f64
    (param f64)
    (param f64)
    (result i32)
    (local f64 f64 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (f64.ne (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "olt_f64" $olt_f64)
  (func $olt_f64
    (param f64)
    (param f64)
    (result i32)
    (local f64 f64 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (f64.lt (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "ole_f64" $ole_f64)
  (func $ole_f64
    (param f64)
    (param f64)
    (result i32)
    (local f64 f64 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (f64.le (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "ogt_f64" $ogt_f64)
  (func $ogt_f64
    (param f64)
    (param f64)
    (result i32)
    (local f64 f64 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (f64.gt (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "oge_f64" $oge_f64)
  (func $oge_f64
    (param f64)
    (param f64)
    (result i32)
    (local f64 f64 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (f64.ge (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "ueq_f64" $ueq_f64)
  (func $ueq_f64
    (param f64)
    (param f64)
    (result i32)
    (local f64 f64 i32 i32 i32 i32 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (f64.eq (get_local 3) (get_local 2)))
    (set_local 5 (f64.ne (get_local 2) (get_local 2)))
    (set_local 6 (f64.ne (get_local 3) (get_local 3)))
    (set_local 7 (i32.or (get_local 6) (get_local 5)))
    (set_local 8 (i32.or (get_local 4) (get_local 7)))
    (return (get_local 8))
  )
  (export "one_f64" $one_f64)
  (func $one_f64
    (param f64)
    (param f64)
    (result i32)
    (local f64 f64 i32 i32 i32 i32 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (f64.ne (get_local 3) (get_local 2)))
    (set_local 5 (f64.eq (get_local 2) (get_local 2)))
    (set_local 6 (f64.eq (get_local 3) (get_local 3)))
    (set_local 7 (i32.and (get_local 6) (get_local 5)))
    (set_local 8 (i32.and (get_local 4) (get_local 7)))
    (return (get_local 8))
  )
  (export "ult_f64" $ult_f64)
  (func $ult_f64
    (param f64)
    (param f64)
    (result i32)
    (local f64 f64 i32 i32 i32 i32 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (f64.lt (get_local 3) (get_local 2)))
    (set_local 5 (f64.ne (get_local 2) (get_local 2)))
    (set_local 6 (f64.ne (get_local 3) (get_local 3)))
    (set_local 7 (i32.or (get_local 6) (get_local 5)))
    (set_local 8 (i32.or (get_local 4) (get_local 7)))
    (return (get_local 8))
  )
  (export "ule_f64" $ule_f64)
  (func $ule_f64
    (param f64)
    (param f64)
    (result i32)
    (local f64 f64 i32 i32 i32 i32 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (f64.le (get_local 3) (get_local 2)))
    (set_local 5 (f64.ne (get_local 2) (get_local 2)))
    (set_local 6 (f64.ne (get_local 3) (get_local 3)))
    (set_local 7 (i32.or (get_local 6) (get_local 5)))
    (set_local 8 (i32.or (get_local 4) (get_local 7)))
    (return (get_local 8))
  )
  (export "ugt_f64" $ugt_f64)
  (func $ugt_f64
    (param f64)
    (param f64)
    (result i32)
    (local f64 f64 i32 i32 i32 i32 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (f64.gt (get_local 3) (get_local 2)))
    (set_local 5 (f64.ne (get_local 2) (get_local 2)))
    (set_local 6 (f64.ne (get_local 3) (get_local 3)))
    (set_local 7 (i32.or (get_local 6) (get_local 5)))
    (set_local 8 (i32.or (get_local 4) (get_local 7)))
    (return (get_local 8))
  )
  (export "uge_f64" $uge_f64)
  (func $uge_f64
    (param f64)
    (param f64)
    (result i32)
    (local f64 f64 i32 i32 i32 i32 i32)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (f64.ge (get_local 3) (get_local 2)))
    (set_local 5 (f64.ne (get_local 2) (get_local 2)))
    (set_local 6 (f64.ne (get_local 3) (get_local 3)))
    (set_local 7 (i32.or (get_local 6) (get_local 5)))
    (set_local 8 (i32.or (get_local 4) (get_local 7)))
    (return (get_local 8))
  )
  (memory 0 0
    (segment 0
      ""
    )
  )
)
