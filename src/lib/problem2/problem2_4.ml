open Helpers

let euler26_4 () =
  let ds = List.init 998 (fun i -> 2 + i) in
  let pairs = List.map (fun d -> (d, cycle_length d)) ds in
  let best_d, _ =
    List.fold_left
      (fun (bd, bl) (d, l) -> if l > bl then (d, l) else (bd, bl))
      (0, 0) pairs
  in
  best_d
