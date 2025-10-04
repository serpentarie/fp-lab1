open Helpers

let euler4_5 () =
  let best = ref 0 in
  for i = 100 to 999 do
    for j = i to 999 do
      let p = i * j in
      if is_pal p && p > !best then best := p
    done
  done;
  !best
