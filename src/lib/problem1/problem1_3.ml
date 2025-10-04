let euler4_3 () =
  let nums = List.init 900 (fun i -> 100 + i) in
  let prods =
    List.concat (List.map (fun a -> List.map (fun b -> a * b) nums) nums)
  in
  let pals = List.filter Helper1.is_pal prods in
  List.fold_left max 0 pals
