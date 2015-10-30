(module
  (export "unused_first" $unused_first)
  (func $unused_first
    (param i32)
    (param i32)
    (result i32)
    (local i32)
    (set_local 2 (get_local 1))
    (return (get_local 2))
  )
  (export "unused_second" $unused_second)
  (func $unused_second
    (param i32)
    (param i32)
    (result i32)
    (local i32)
    (set_local 2 (get_local 0))
    (return (get_local 2))
  )
  (memory 0 0
    (segment 0
      ""
    )
  )
)
