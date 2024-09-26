(module
  (memory (export "memory") 1)

  ;; Find the sum of the first $n u8 numbers in memory.
  ;; If $n <= 0, return 0.
  (func (export "sum") (param $n i32) (result i32)
    (local $i i32)
    (local $total i32)

    (if
      (i32.le_s (local.get $n) (i32.const 0)) ;; $n <= 0
      (then (return (i32.const 0)))
    )

    (loop $loop
      (local.set $total
        (i32.add
          (local.get $total)
          (i32.load8_u (local.get $i))
        )
      )

      (local.set $i (i32.add (local.get $i) (i32.const 1))) ;; $i += 1
      (br_if $loop (i32.lt_s (local.get $i) (local.get $n))) ;; $i < $n
    )

    local.get $total
  )
)
