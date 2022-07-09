namespace Second

module Second =
    let makeSegment pointA pointB = (pointA, pointB)

    let startSegment segment =
        let (point, _) = segment
        point

    let endSegment segment =
        let (_, point) = segment
        point

    let makePoint x y = (x, y)

    let xPoint point =
        let (x, _) = point
        x

    let yPoint point =
        let (_, y) = point
        y

    let midPointSegment segment =
        let (p1, p2) = (startSegment segment, endSegment segment)
        (((xPoint p1) + (xPoint p2)) / 2, ((yPoint p1) + (yPoint p2)) / 2)
