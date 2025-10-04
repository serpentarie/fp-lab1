let euler4_4 () =
  let range = List.init 900 (fun i -> 100 + i) in
  let nested = List.map (fun a -> List.map (fun b -> a * b) range) range in
  let prods = List.flatten nested in
  let pals = List.filter Helper1.is_pal prods in

  List.fold_left max 0 pals
