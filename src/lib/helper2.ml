let cycle_length d =
  if d = 0 then 0
  else
    let rec aux rem pos seen =
      if rem = 0 then 0
      else
        match List.assoc_opt rem seen with
        | Some prev_pos -> pos - prev_pos
        | None ->
            let seen' = (rem, pos) :: seen in
            aux (rem * 10 mod d) (pos + 1) seen'
    in
    aux (1 mod d) 0 []
