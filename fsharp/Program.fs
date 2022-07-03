open Second.Second
open Second.Third

[<EntryPoint>]
let main args =
    let rect = makeRectangle (makePoint 1 9) (makePoint 5 1)
    printfn $"{areaRectangle rect}"
    printfn $"{perimeterRectangle rect}"
    0
