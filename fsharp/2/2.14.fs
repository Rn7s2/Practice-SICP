namespace Second

module Fourteenth =
    open Second.Seventh
    open Second.Twelfth

    let eq1 r1 r2 =
        divInterval (mulInterval r1 r2) (addInterval r1 r2)

    let eq2 r1 r2 =
        let one = makeInterval 1.0 1.0
        divInterval one (addInterval (divInterval one r1) (divInterval one r2))

    let test =
        let r1 = makeCenterPercent 10 1
        let r2 = makeCenterPercent 5 2
        printfn $"{divInterval r1 r1}"
        printfn $"{divInterval r1 r2}"
        printfn $"{eq1 r1 r2}"
        printfn $"{eq2 r1 r2}"
