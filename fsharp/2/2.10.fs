namespace Second

module Tenth =
    open Second.Seventh

    let divInterval x y =
        if lowerBound y * upperBound y <= 0.0 then
            failwith "Encountered with a cross-zero interval."

        mulInterval x (makeInterval (1.0 / upperBound y) (1.0 / lowerBound y))

    let test = printfn $"{divInterval (makeInterval 2 4) (makeInterval -1 5)}"
