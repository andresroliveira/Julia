x, y = [parse(Float64, input) for input in split(readline(), " ")]

if x == 0 && y == 0
    println("Origem")
elseif x == 0 