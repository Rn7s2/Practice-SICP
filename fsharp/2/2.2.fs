namespace Second

module Second =
    let makeSegment (pointA: float * float) (pointB: float * float) = (pointA, pointB)

    let startSegment (segment: 'a * 'a) =
        let (point, _) = segment
        point

    let endSegment (segment: 'a * 'a) =
        let (_, point) = segment
        point

    let makePoint (x: float) (y: float) = (x, y)

    let xPoint (point: float * float) =
        let (x, _) = point
        x

    let yPoint (point: float * float) =
        let (_, y) = point
        y

    let midPointSegment segment =
        let (p1, p2) = (startSegment segment, endSegment segment)
        ((xPoint p1 + xPoint p2) / 2.0, (yPoint p1 + yPoint p2) / 2.0)
