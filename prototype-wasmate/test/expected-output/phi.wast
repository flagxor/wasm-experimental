(module
  (export "test0" $test0)
  (func $test0
    (param i32)
    (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    (block $BB0_2
    (set_local 7 (get_local 0))
    (set_local 4 (i32.const -1))
    (set_local 5 (i32.gt_s (get_local 7) (get_local 4)))
    (br_if $BB0_2 (get_local 5))
    (set_local 6 (i32.const 3))
    (set_local 7 (i32.div_s (get_local 7) (get_local 6)))
    )
    (return (get_local 7))
  )
  (export "test1" $test1)
  (func $test1
    (param i32)
    (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    (set_local 7 (i32.const 1))
    (set_local 10 (i32.const 0))
    (set_local 5 (get_local 0))
    (set_local 11 (get_local 7))
    (set_local 12 (get_local 10))
    (loop $BB1_1
    (set_local 2 (get_local 11))
    (set_local 11 (get_local 10))
    (set_local 12 (i32.add (get_local 12) (get_local 7)))
    (set_local 9 (i32.lt_s (get_local 12) (get_local 5)))
    (set_local 10 (get_local 2))
    (br_if $BB1_1 (get_local 9))
    (return (get_local 11))
  )
  (memory 0 0
    (segment 0
      ""
    )
  )
)
