(module
  ;; Return the larger parameter.
  (func (export "max") (param i32) (param i32) (result i32)
    local.get 0
    local.get 1
    i32.gt_s
    if (result i32)
      local.get 0
    else
      local.get 1
    end
  )
)

