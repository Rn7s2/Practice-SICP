namespace Second

module Seventh =
    let makeInterval (a: float) (b: float) = (a, b)

    let lowerBound x =
        let (a, _) = x
        a

    let upperBound x =
        let (_, b) = x
        b

    let addInterval x y =
        makeInterval (lowerBound x + lowerBound y) (upperBound x + upperBound y)

    let mulInterval x y =
        let p1 = lowerBound x * lowerBound y
        let p2 = lowerBound x * upperBound y
        let p3 = upperBound x * lowerBound y
        let p4 = upperBound x * upperBound y
        let arr = [ p1; p2; p3; p4 ]
        makeInterval (List.min arr) (List.max arr)

    let divInterval x y =
        mulInterval x (makeInterval (1.0 / upperBound y) (1.0 / lowerBound y))

    let test = printfn $"{mulInterval (makeInterval 2 4) (makeInterval 3 5)}"
