open Alcotest
module P1_1 = Problem1.Problem1_1
module P1_2 = Problem1.Problem1_2
module P1_3 = Problem1.Problem1_3
module P1_4 = Problem1.Problem1_4
module P1_5 = Problem1.Problem1_5
module P1_6 = Problem1.Problem1_6
module P2_1 = Problem2.Problem2_1
module P2_2 = Problem2.Problem2_2
module P2_3 = Problem2.Problem2_3
module P2_4 = Problem2.Problem2_4
module P2_5 = Problem2.Problem2_5
module P2_6 = Problem2.Problem2_6

let expected_euler4 = 906609
let expected_euler26 = 983

let test_euler4_1 () =
  check int "tail recursion" expected_euler4 (P1_1.euler4_1 ())

let test_euler4_2 () = check int "recursion" expected_euler4 (P1_2.euler4_2 ())
let test_euler4_3 () = check int "modular" expected_euler4 (P1_3.euler4_3 ())
let test_euler4_4 () = check int "map" expected_euler4 (P1_4.euler4_4 ())
let test_euler4_5 () = check int "for loop" expected_euler4 (P1_5.euler4_5 ())
let test_euler4_6 () = check int "seq" expected_euler4 (P1_6.euler4_6 ())

let test_euler26_1 () =
  check int "tail recursion" expected_euler26 (P2_1.euler26_1 ())

let test_euler26_2 () =
  check int "recursion" expected_euler26 (P2_2.euler26_2 ())

let test_euler26_3 () = check int "modular" expected_euler26 (P2_3.euler26_3 ())
let test_euler26_4 () = check int "map" expected_euler26 (P2_4.euler26_4 ())

let test_euler26_5 () =
  check int "for loop" expected_euler26 (P2_5.euler26_5 ())

let test_euler26_6 () = check int "seq" expected_euler26 (P2_6.euler26_6 ())

let () =
  run "lab1"
    [
      ( "Euler4",
        [
          test_case "tail recursion" `Quick test_euler4_1;
          test_case "recursion" `Quick test_euler4_2;
          test_case "modular" `Quick test_euler4_3;
          test_case "map" `Quick test_euler4_4;
          test_case "for loop" `Quick test_euler4_5;
          test_case "seq" `Quick test_euler4_6;
        ] );
      ( "Euler26",
        [
          test_case "tail recursion" `Quick test_euler26_1;
          test_case "recursion" `Quick test_euler26_2;
          test_case "modular" `Quick test_euler26_3;
          test_case "map" `Quick test_euler26_4;
          test_case "for loop" `Quick test_euler26_5;
          test_case "seq" `Quick test_euler26_6;
        ] );
    ]
