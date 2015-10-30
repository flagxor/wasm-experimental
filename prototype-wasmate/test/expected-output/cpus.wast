(module
  (export "f" $f)
  (func $f
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
