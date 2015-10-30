(module
  (export "f0" $f0)
  (func $f0
    (return)
  )
  (export "f1" $f1)
  (func $f1
    (result i32)
    (local i32)
    (set_local 0 (i32.const 0))
    (return (get_local 0))
  )
  (export "f2" $f2)
  (func $f2
    (param i32)
    (param f32)
    (result i32)
    (local i32)
    (set_local 2 (i32.const 0))
    (return (get_local 2))
  )
  (export "f3" $f3)
  (func $f3
    (param i32)
    (param f32)
    (return)
  )
  (memory 0 0
    (segment 0
      ""
    )
  )
)
