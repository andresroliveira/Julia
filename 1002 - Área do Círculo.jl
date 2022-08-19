using Printf

r = parse(Float64, readline())

p = 3.14159
a = p * r * r

@printf "A=%.4f" a