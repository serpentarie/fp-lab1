let cycle_length d =
  if d = 0 then 0
  else
    let table = Hashtbl.create 128 in
    let rec aux rem pos =
      if rem = 0 then 0
      else
        match Hashtbl.find_opt table rem with
        | Some prev_pos -> pos - prev_pos
        | None ->
            Hashtbl.replace table rem pos;
            aux (rem * 10 mod d) (pos + 1)
    in
    aux (1 mod d) 0
