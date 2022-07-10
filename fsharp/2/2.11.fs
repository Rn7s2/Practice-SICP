namespace Second

module Eleventh =
    open Second.Seventh

    // 无比混乱，只有非常频繁调用的代码才值得这样优化
    // 而且编译器的能力超乎我们的想象，根本不值得这么做！
    let mulInterval x y =
        let pos n = n >= 0
        let neg n = n < 0

        let (al, ah, bl, bh) = (lowerBound x, upperBound x, lowerBound y, upperBound y)

        if pos al && pos ah && pos bl && pos bh then
            makeInterval (al * bl) (ah * bh)
        elif pos al && pos ah && neg bl && pos bh then
            makeInterval (ah * bl) (ah * bh)
        elif pos al && pos ah && neg bl && neg bh then
            makeInterval (ah * bl) (al * bh)
        elif neg al && pos ah && pos bl && pos bh then
            makeInterval (al * bh) (ah * bh)
        elif neg al && pos ah && neg bl && pos bh then
            makeInterval (min al bh * max ah bl) (ah * bh)
        elif neg al && pos ah && neg bl && neg bh then
            makeInterval (ah * bl) (al * bl)
        elif neg al && neg ah && pos bl && pos bh then
            makeInterval (al * bh) (ah * bl)
        elif neg al && neg ah && neg bl && pos bh then
            makeInterval (al * bh) (al * bl)
        elif neg al && neg ah && neg bl && neg bh then
            makeInterval (ah * bh) (al * bl)
        else
            failwith "Interval pattern cannot be recognized."
