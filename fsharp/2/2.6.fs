namespace Second

module Sixth =
    let zero f = fun (x) -> x
    let one f = fun (x) -> f x
    let two f = fun (x) -> f (f x)
    let addOne n = fun (f) -> fun (x) -> f (n f) x
    let add a b = fun (f) -> fun (x) -> a f (b f x)

    let test =
        let f =
            fun (x) ->
                printfn $"I'm applied, argument: {x}"
                x

        printfn "Here is zero:"
        zero f 5 |> ignore

        printfn "\nHere is one:"
        one f 5 |> ignore

        printfn "\nHere is two:"
        two f 5 |> ignore

        printfn "\nHere is one \'+\' two:"
        add one two f 5 |> ignore
