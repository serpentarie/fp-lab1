let rev_int n =
  let rec aux acc n =
    if n = 0 then acc else aux ((acc * 10) + (n mod 10)) (n / 10)
  in
  aux 0 n

let is_pal n = n = rev_int n

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
