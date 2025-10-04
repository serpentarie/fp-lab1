let euler4_1 () =
  let rec loop i j best =
    if i < 100 then best
    else if j < 100 then loop (i - 1) (i - 1) best
    else
      let prod = i * j in
      let best = if prod > best && Helper1.is_pal prod then prod else best in
      loop i (j - 1) best
  in
  loop 999 999 0
