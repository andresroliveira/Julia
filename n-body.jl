begin
    using Plots
    using LinearAlgebra
    gr()
    # plotly()
end

mutable struct Body
    p::Vector{Real}
    v::Vector{Real}
    m::Real
end

begin
    Δt = 1 / 3000
    G = 1
    N = 3
end


function interact!(A::Body, B::Body)
    rba = B.p - A.p
    ma = A.m
    mb = B.m

    Fba = (-G * ma * mb / norm(rba)^3) * rba
    Fab = -Fba

    B.v += (Fba / mb) * Δt
    A.v += (Fab / ma) * Δt
end

function update!(body::Body)
    body.p += body.v * Δt
end

function step!(bodies::Vector{Body})
    for i ∈ 1:N
        for j ∈ i+1:N
            interact!(bodies[i], bodies[j])
        end
    end

    for i ∈ 1:N
        update!(bodies[i])
    end
end

function main()
    bodies::Vector{Body} = [Body([0.0, 0], [0, 0], 30),
        Body([1, 0], [0, 3], 2),
        Body([-1, 1], [3, -3], 1)
    ]

    @gif for t ∈ 0:Δt:5
        step!(bodies)
        p = plot(xlims=(-3, 3), ylims=(-3, 3), ratio=1)

        for i in 1:N
            x, y = bodies[i].p
            scatter!(p, [x], [y], markersize=bodies[i].m, label=nothing)
        end
        p
    end every 100
end

main()