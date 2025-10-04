open Helpers

let euler4_6 () =
  let range = Seq.init 900 (fun i -> 100 + i) in
  range
  |> Seq.flat_map (fun a -> Seq.init 900 (fun j -> a * (100 + j)))
  |> Seq.filter is_pal |> Seq.fold_left max 0
