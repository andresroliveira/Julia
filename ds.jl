begin
    using Plots
    using InteractiveUtils
    using LinearAlgebra
end

mutable struct PredatorPrey
    x::Float32
    y::Float32
end

struct LotkaVolterra
    dt::Float32
    α::Float32
    β::Float32
    δ::Float32
    γ::Float32
end

function step!(s::PredatorPrey, lv::LotkaVolterra)
    dx = (lv.α*s.x - lv.β *s.x * s.y)
    dy = (lv.δ * s.x * s.y - lv.γ * s.y)

    s.x += dx*lv.dt
    s.y += dy*lv.dt
end

function main()
    lv = LotkaVolterra(0.001, 2 / 3, 4 / 3, 1, 1)
    pp = PredatorPrey(2, 1)

    # p = plot(xlim=(0, 3), ylim=(0, 2))

    scatter([pp.x], [pp.y], label=nothing, xlim=(0, 3), ylim=(0, 2))

    @gif for i = 1:8500
        step!(pp, lv)
        scatter([pp.x], [pp.y], label=nothing, xlim=(0, 3), ylim=(0, 2))
        # push!(p, pp.x, pp.y)
    end every 100 
end

main()