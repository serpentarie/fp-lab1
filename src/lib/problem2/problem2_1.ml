let euler26_1 () =
  let rec loop d best_d best_len =
    if d >= 1000 then best_d
    else
      let len = Helper2.cycle_length d in
      if len > best_len then loop (d + 1) d len
      else loop (d + 1) best_d best_len
  in
  loop 2 0 0
