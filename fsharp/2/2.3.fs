namespace Second

module Third =
    open Second.Second

    let makeRectangle (p1: 'a) (p2: 'a) = (p1, p2)

    let topLeftPoint (rect: 'a * 'a) =
        let (p1, _) = rect
        p1

    let bottomRightPoint (rect: 'a * 'a) =
        let (_, p2) = rect
        p2

    let perimeterRectangle rect =
        let (p1, p2) = (topLeftPoint rect, bottomRightPoint rect)

        ((xPoint p2 - xPoint p1) + (yPoint p1 - yPoint p2))
        * 2.0

    let areaRectangle rect =
        let (p1, p2) = (topLeftPoint rect, bottomRightPoint rect)

        (xPoint p2 - xPoint p1) * (yPoint p1 - yPoint p2)
