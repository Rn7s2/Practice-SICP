namespace Second

module Twelfth =
    open Second.Seventh

    let makeCenterWidth c w = makeInterval (c - w) (c + w)
    let center i = (lowerBound i + upperBound i) / 2.0
    let width i = (upperBound i - lowerBound i) / 2.0

    let makeCenterPercent c p =
        let w = c * p / 100.0
        makeCenterWidth c w

    let percent i =
        let w = width i
        w * 100.0 / center i

    let test =
        let x = makeCenterPercent 5 10
        let p = percent x
        printfn $"{x}"
        printfn $"{p}"
