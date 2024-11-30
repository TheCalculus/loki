open Bogue
open Printf
module W = Widget
module L = Layout

let main () =
  let input = W.text_input ~max_size:200 ~size:40 ~prompt:"enter alias" () in
  let label = W.label ~size:40 "" in
  let action button = print_endline (sprintf "Button: %b" button) in
  let button = W.button ~action "presss me" in
  let layout = L.tower [L.resident ~w:400 input;
                        L.resident ~w:400 ~h:60 label;
                        L.resident button;] in

  let before_display () =
    let text = W.get_text input in
    let hash = Hashtbl.hash text in
    W.set_text label (string_of_int hash) in

  let board = Bogue.make [] [layout] in
  Bogue.run ~before_display board;;

let _ = main ();
  Bogue.quit ();
