(module
  (import $exit "" "exit" (param i32))
  (export "main" $main)
  (func $main
    (result i32)
    (local i32)
    (set_local 0 (i32.const 0))
    (call_import $exit (get_local 0))
  )
  (memory 0 0
    (segment 0
      ""
    )
  )
)
