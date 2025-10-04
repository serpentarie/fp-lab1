open Helpers

let euler26_3 () =
  let ds = List.init (999 - 2 + 1) (fun i -> 2 + i) in
  let pairs = List.map (fun d -> (d, cycle_length d)) ds in
  List.fold_left
    (fun (md, ml) (d, len) -> if len > ml then (d, len) else (md, ml))
    (0, 0) pairs
  |> fst
