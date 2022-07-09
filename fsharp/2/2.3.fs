namespace Second

module Third =
    open Second.Second

    let makeRectangle p1 p2 = (p1, p2)

    let topLeftPoint rect =
        let (p1, _) = rect
        p1

    let bottomRightPoint rect =
        let (_, p2) = rect
        p2

    let perimeterRectangle rect =
        let (p1, p2) = (topLeftPoint rect, bottomRightPoint rect)

        2 * ((xPoint p2) - (xPoint p1))
        + 2 * ((yPoint p1) - (yPoint p2))

    let areaRectangle rect =
        let (p1, p2) = (topLeftPoint rect, bottomRightPoint rect)

        ((xPoint p2) - (xPoint p1))
        * ((yPoint p1) - (yPoint p2))
