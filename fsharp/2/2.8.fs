namespace Second

module Eighth =
    open Second.Seventh

    let negInterval x =
        makeInterval (-upperBound x) (-lowerBound x)

    let subInterval a b = addInterval a (negInterval b)

    let test = printfn $"{subInterval (makeInterval 3 4) (makeInterval 1 2)}"
