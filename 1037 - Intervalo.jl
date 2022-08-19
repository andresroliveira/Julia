x = parse(Float64, readline())

if x >= 0 && x <= 25
    println("Intervalo [0,25]")
elseif x > 25 && x <= 50
    println("Intervalo (25,50]")
elseif x > 50 && x <= 75
    println("Intervalo (50,75]")
elseif x > 75 && x <= 100
    println("Intervalo (75,100]")
else
    println("Fora de intervalo")
end