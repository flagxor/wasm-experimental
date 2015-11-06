;; This file was generated by wasmate.py, which is a script that converts
;; from the "flat" text assembly syntax emitted by LLVM into the s-expression
;; syntax expected by the spec repository.
;;
;; Note: this is a hack. A real toolchain will eventually be needed.
;;

(module
  (export "add64" $add64)
  (func $add64
    (param i64)
    (param i64)
    (result i64)
    (local i64 i64 i64)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (i64.add (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "sub64" $sub64)
  (func $sub64
    (param i64)
    (param i64)
    (result i64)
    (local i64 i64 i64)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (i64.sub (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "mul64" $mul64)
  (func $mul64
    (param i64)
    (param i64)
    (result i64)
    (local i64 i64 i64)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (i64.mul (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "sdiv64" $sdiv64)
  (func $sdiv64
    (param i64)
    (param i64)
    (result i64)
    (local i64 i64 i64)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (i64.div_s (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "udiv64" $udiv64)
  (func $udiv64
    (param i64)
    (param i64)
    (result i64)
    (local i64 i64 i64)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (i64.div_u (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "srem64" $srem64)
  (func $srem64
    (param i64)
    (param i64)
    (result i64)
    (local i64 i64 i64)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (i64.rem_s (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "urem64" $urem64)
  (func $urem64
    (param i64)
    (param i64)
    (result i64)
    (local i64 i64 i64)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (i64.rem_u (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "and64" $and64)
  (func $and64
    (param i64)
    (param i64)
    (result i64)
    (local i64 i64 i64)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (i64.and (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "or64" $or64)
  (func $or64
    (param i64)
    (param i64)
    (result i64)
    (local i64 i64 i64)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (i64.or (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "xor64" $xor64)
  (func $xor64
    (param i64)
    (param i64)
    (result i64)
    (local i64 i64 i64)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (i64.xor (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "shl64" $shl64)
  (func $shl64
    (param i64)
    (param i64)
    (result i64)
    (local i64 i64 i64)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (i64.shl (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "shr64" $shr64)
  (func $shr64
    (param i64)
    (param i64)
    (result i64)
    (local i64 i64 i64)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (i64.shr_u (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "sar64" $sar64)
  (func $sar64
    (param i64)
    (param i64)
    (result i64)
    (local i64 i64 i64)
    (set_local 2 (get_local 1))
    (set_local 3 (get_local 0))
    (set_local 4 (i64.shr_s (get_local 3) (get_local 2)))
    (return (get_local 4))
  )
  (export "clz64" $clz64)
  (func $clz64
    (param i64)
    (result i64)
    (local i64 i64)
    (set_local 1 (get_local 0))
    (set_local 2 (i64.clz (get_local 1)))
    (return (get_local 2))
  )
  (export "clz64_zero_undef" $clz64_zero_undef)
  (func $clz64_zero_undef
    (param i64)
    (result i64)
    (local i64 i64)
    (set_local 1 (get_local 0))
    (set_local 2 (i64.clz (get_local 1)))
    (return (get_local 2))
  )
  (export "ctz64" $ctz64)
  (func $ctz64
    (param i64)
    (result i64)
    (local i64 i64)
    (set_local 1 (get_local 0))
    (set_local 2 (i64.ctz (get_local 1)))
    (return (get_local 2))
  )
  (export "ctz64_zero_undef" $ctz64_zero_undef)
  (func $ctz64_zero_undef
    (param i64)
    (result i64)
    (local i64 i64)
    (set_local 1 (get_local 0))
    (set_local 2 (i64.ctz (get_local 1)))
    (return (get_local 2))
  )
  (export "popcnt64" $popcnt64)
  (func $popcnt64
    (param i64)
    (result i64)
    (local i64 i64)
    (set_local 1 (get_local 0))
    (set_local 2 (i64.popcnt (get_local 1)))
    (return (get_local 2))
  )
  (memory 0 0
    (segment 0
      ""
    )
  )
)
