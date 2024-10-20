function arraysum(ar::AbstractVector{<:Number})::Float64
    sum = 0
    for i in ar
        sum += i
    end
    return sum
end

function mul35sum(N::Integer)::Int64
    resultArray::Array{Int} = []
    sum = Int64(0)
    i = 1
    while i < N
        if (i % 3 == 0) || (i % 5 ==0)
            push!(resultArray, i)
        end
        i += 1
    end
    sum = arraysum(resultArray)
    return sum
end