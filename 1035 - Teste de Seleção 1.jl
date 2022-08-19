a,b,c,d = [parse(Int64, input) for input in split(readline(), " ")]

if b > c && d > a && c + d > a + b && c > 0 && d > 0 && a % 2 == 0
    println("Valroes aceitos")
else
    println("Valroes nao aceitos")
end