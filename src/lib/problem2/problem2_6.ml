let euler26_6 () =
  let s =
    Seq.init (999 - 2 + 1) (fun i -> 2 + i)
    |> Seq.map (fun d -> (d, Helper2.cycle_length d))
  in
  Seq.fold_left
    (fun (bd, bl) (d, l) -> if l > bl then (d, l) else (bd, bl))
    (0, 0) s
  |> fst
