namespace Second

module ThirtyFourth =
    open Second.ThirtyThird

    let hornerEval x coefficientSequence =
        accumulate (fun thisCoeff higherTerms -> thisCoeff + x * higherTerms) 0 coefficientSequence

    let test = printfn $"{hornerEval 2 [ 1; 3; 0; 5; 0; 1 ]}"
