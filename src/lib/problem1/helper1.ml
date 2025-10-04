let rev_int n =
  let rec aux acc n =
    if n = 0 then acc else aux ((acc * 10) + (n mod 10)) (n / 10)
  in
  aux 0 n

let is_pal n = n = rev_int n
