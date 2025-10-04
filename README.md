## Мазайкина Мария Дмитриевна | P3309

### Лабораторная работа 1. Вариант: 4, 26

### Problem 4. Largest Palindrome Product
[https://projecteuler.net/problem=4](https://projecteuler.net/problem=4)

#### Описание проблемы
Найти наибольший палиндром, который является произведением двух трёхзначных чисел.

#### Ключевые элементы реализаций
##### 1.1 Хвостовая рекурсия
```ocaml
let euler4_1 () =
  let rec loop i j best =
    if i < 100 then best
    else if j < 100 then loop (i - 1) (i - 1) best
    else
      let prod = i * j in
      let best = if prod > best && is_pal prod then prod else best in
      loop i (j - 1) best
  in
  loop 999 999 0
```

##### 1.2 Монолитная обычная рекурсия
```ocaml
let euler4_2 () =
  let rec loop_i i =
    if i < 100 then 0
    else
      let rec loop_j j =
        if j < 100 then 0
        else
          let p = i * j in
          let cand = if is_pal p then p else 0 in
          max cand (loop_j (j - 1))
      in
      max (loop_j i) (loop_i (i - 1))
  in
  loop_i 999
```

##### 1.3 Модульная реализация
```ocaml
let euler4_3 () =
  let nums = List.init 900 (fun i -> 100 + i) in
  let prods =
    List.concat (List.map (fun a -> List.map (fun b -> a * b) nums) nums)
  in
  let pals = List.filter is_pal prods in
  List.fold_left max 0 pals

```

##### 1.4 С использованием отображения
```ocaml
let euler4_4 () =
  let range = List.init 900 (fun i -> 100 + i) in
  let nested = List.map (fun a -> List.map (fun b -> a * b) range) range in
  let prods = List.flatten nested in
  let pals = List.filter is_pal prods in

  List.fold_left max 0 pals
```

##### 1.5 С циклами
```ocaml
let euler4_5 () =
  let best = ref 0 in
  for i = 100 to 999 do
    for j = i to 999 do
      let p = i * j in
      if is_pal p && p > !best then best := p
    done
  done;
  !best
```

##### 1.6 С последовательностями
```ocaml
let euler4_6 () =
  let range = Seq.init 900 (fun i -> 100 + i) in
  range
  |> Seq.flat_map (fun a -> Seq.init 900 (fun j -> a * (100 + j)))
  |> Seq.filter is_pal |> Seq.fold_left max 0

```

### Problem 26. Reciprocal Cycles
[https://projecteuler.net/problem=26](https://projecteuler.net/problem=26)

#### Описание проблемы
Найти такое значение d (меньше 1000), для которого единичная дробь 1/d имеет самый длинный период в своей десятичной дробной части.

#### Ключевые элементы реализаций
##### 2.1 Хвостовая рекурсия
```ocaml
let euler26_1 () =
  let rec loop d best_d best_len =
    if d >= 1000 then best_d
    else
      let len = cycle_length d in
      if len > best_len then loop (d + 1) d len
      else loop (d + 1) best_d best_len
  in
  loop 2 0 0
```

##### 2.2 Монолитная обычная рекурсия
```ocaml
let euler26_2 () =
  let rec build d =
    if d >= 1000 then [] else (d, cycle_length d) :: build (d + 1)
  in
  let pairs = build 2 in
  fst
    (List.fold_left
       (fun (md, ml) (d, len) -> if len > ml then (d, len) else (md, ml))
       (0, 0) pairs)
```

##### 2.3 Модульная реализация
```ocaml
let euler26_3 () =
  let ds = List.init (999 - 2 + 1) (fun i -> 2 + i) in
  let pairs = List.map (fun d -> (d, cycle_length d)) ds in
  List.fold_left
    (fun (md, ml) (d, len) -> if len > ml then (d, len) else (md, ml))
    (0, 0) pairs
  |> fst
```

##### 2.4 С использованием отображения
```ocaml
let euler26_4 () =
  let ds = List.init 998 (fun i -> 2 + i) in
  let pairs = List.map (fun d -> (d, cycle_length d)) ds in
  let best_d, _ =
    List.fold_left
      (fun (bd, bl) (d, l) -> if l > bl then (d, l) else (bd, bl))
      (0, 0) pairs
  in
  best_d
```

##### 2.5 С циклами
```ocaml
let euler26_5 () =
  let best_d = ref 0 in
  let best_len = ref 0 in
  for d = 2 to 999 do
    let len = cycle_length d in
    if len > !best_len then (
      best_len := len;
      best_d := d)
  done;
  !best_d
```

##### 2.6 С последовательностями
```ocaml
let euler26_6 () =
  let s =
    Seq.init (999 - 2 + 1) (fun i -> 2 + i)
    |> Seq.map (fun d -> (d, cycle_length d))
  in
  Seq.fold_left
    (fun (bd, bl) (d, l) -> if l > bl then (d, l) else (bd, bl))
    (0, 0) s
  |> fst
```

### Выводы

В общем, классненько порешала проблемки Эйлера разными способами, Ocaml справился и я тоже 👍🐪🎀
Если говорить по любимой моей реализации, то это ❤️‍🔥Seq❤️‍🔥 -- последовательности ООЧЕнь Ленивые 

Я бы описала эту лабу одной песней:
[EL PROBLEMA](https://youtu.be/cdk4hVPN_F0?si=xntWwfP_3VgT4pJD)