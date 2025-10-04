let euler26_2 () =
  let rec build d =
    if d >= 1000 then [] else (d, Helpers.cycle_length d) :: build (d + 1)
  in
  let pairs = build 2 in
  fst
    (List.fold_left
       (fun (md, ml) (d, len) -> if len > ml then (d, len) else (md, ml))
       (0, 0) pairs)
