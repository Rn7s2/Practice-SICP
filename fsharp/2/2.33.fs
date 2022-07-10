namespace Second

module ThirtyThird =
    let accumulate op initial sequence = List.foldBack op sequence initial

    let map p sequence =
        accumulate (fun x acc -> (p x) :: acc) List.Empty sequence

    let append (seq1: 'a list) (seq2: 'a list) =
        accumulate (fun x acc -> x :: acc) seq2 seq1

    let length sequence =
        accumulate (fun x acc -> 1 + acc) 0 sequence

    let test =
        printfn $"{map (fun x -> x * x) [ 1; 2; 3 ]}"
        printfn $"%A{append [ 1; 2; 3 ] [ 6; 7; 8; 9 ]}"
        printfn $"{length [ 1; 2; 3; 4; 5 ]}"
