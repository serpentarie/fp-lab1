let euler4_2 () =
  let rec loop_i i =
    if i < 100 then 0
    else
      let rec loop_j j =
        if j < 100 then 0
        else
          let p = i * j in
          let cand = if Helper1.is_pal p then p else 0 in
          max cand (loop_j (j - 1))
      in
      max (loop_j i) (loop_i (i - 1))
  in
  loop_i 999
