(module
  (export "ldi32" $ldi32)
  (func $ldi32
    (param i32)
    (result i32)
    (local i32 i32)
    (set_local 1 (get_local 0))
    (set_local 2 (i32.load (get_local 1)))
    (return (get_local 2))
  )
  (export "ldi64" $ldi64)
  (func $ldi64
    (param i32)
    (result i64)
    (local i32 i64)
    (set_local 1 (get_local 0))
    (set_local 2 (i64.load (get_local 1)))
    (return (get_local 2))
  )
  (export "ldf32" $ldf32)
  (func $ldf32
    (param i32)
    (result f32)
    (local i32 f32)
    (set_local 1 (get_local 0))
    (set_local 2 (f32.load (get_local 1)))
    (return (get_local 2))
  )
  (export "ldf64" $ldf64)
  (func $ldf64
    (param i32)
    (result f64)
    (local i32 f64)
    (set_local 1 (get_local 0))
    (set_local 2 (f64.load (get_local 1)))
    (return (get_local 2))
  )
  (memory 0 0
    (segment 0
      ""
    )
  )
)
