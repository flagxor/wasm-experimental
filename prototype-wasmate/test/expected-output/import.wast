(module
  (import $printi "" "printi" (param i32) (result i32))
  (import $printf "" "printf" (param f32) (result f32))
  (import $printv "" "printv" (param))
  (import $add2 "" "add2" (param i32 i32) (result i32))
  (export "f" $f)
  (func $f
    (param i32)
    (param f32)
    (local f32 i32 i32 f32)
    (set_local 3 (get_local 0))
    (set_local 2 (get_local 1))
    (set_local 4 (call_import $printi (get_local 3)))
    (set_local 5 (call_import $printf (get_local 2)))
    (call_import $printv)
    (return)
  )
  (memory 0 0
    (segment 0
      ""
    )
  )
)
