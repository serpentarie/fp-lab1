let euler26_5 () =
  let best_d = ref 0 in
  let best_len = ref 0 in
  for d = 2 to 999 do
    let len = Helper2.cycle_length d in
    if len > !best_len then (
      best_len := len;
      best_d := d)
  done;
  !best_d
