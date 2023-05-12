function arc(x, y, from, to, radius=0, diameter=0, $fn=0, $fa=0, $fs=0) =
    let(
        radius = radius ? abs(radius) : abs(diameter/2),
        diameter = radius*2,
        span = to-from,
        bias = span/abs(span),
        step = (($fn>0) ? abs(span)/$fn : ($fa>0||$fs>0) ? max($fa, asin($fs/diameter)*2) : asin(1/diameter)*2)*bias,
        normal = from+abs(from%step)*bias
    ) concat(
        [[x + sin(from)*radius, y + cos(from)*radius]],
        [for (a = [normal:step:to]) [x + sin(a)*radius, y + cos(a)*radius]],
        to%step ? [[x + sin(to)*radius, y + cos(to)*radius]] : []
    );
