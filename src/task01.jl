export getdigits, touppercase, firstnorm, secondnorm, infnorm, isleap, chesscolor

function getdigits(a)
    result::Array{Int} = []
    str_a = string(a)
    for i in str_a
        if isdigit(i)
            push!(result, parse(Int, i))
        end
    end
    return result
end

println(getdigits(0123)) # test function getdigits

function touppercase(input_text)
    result = ""
    for char in input_text
        code = Int(char)
        
        if 'a' <= char <= 'z'
            result *= Char(code - 32)
        elseif 'а' <= char <= 'я'
            result *= Char(code - 32)
        else
            result *= char
        end
    end
    return result
# The function may have a problems with other languages
end

println(touppercase("testing a function with different symbols - 123№")) # test function touppercase

function firstnorm(vec_::AbstractVector{<:Number})
    result = 0
    for i in vec_
        result += abs(i)
    end
    return result
end

println(firstnorm([1, 5, -8, 8])) # test function firstnorm

function secondnorm(vec_::AbstractVector{<:Number})
    result = 0
    for i in vec_
        result += i^2
    end
    result = (result)^(1/2)
    return result
end

println(secondnorm([3, -4, 5])) # test function secondnorm

function infnorm(vec_::AbstractVector{<:Number})
    result = 0
    x = abs(vec_[1])
    for i in vec_
        if abs(i) >= x
            x = abs(i)
        end
        result = x
    end
    return result
end

println(infnorm([3, -4, 5, -9.3, 3, 6])) # test function infnorm

function firstnorm(vec_::AbstractMatrix{<:Number})
    result = 0
    for i in axes(vec_, 1)
        for j in axes(vec_, 2)
            result += abs(vec_[i, j])
        end
    end
    return result
end

A = rand(1:10, 3, 3)
println(A)
println(firstnorm(A)) # test function firstnorm

function infnorm(vec_::AbstractMatrix{<:Number})
    result = 0
    for i in axes(vec_, 1)
        x = 0
        for j in axes(vec_, 2)
            x += abs(vec_[i, j])
        end
        if x > result
            result = x
        end
    end
    return result
end

B = rand(1:10, 3, 3)
println(B)
println(infnorm(B)) # test function infnorm

function isleap(year)
    if year % 4 == 0
        if year % 100 == 0
            if year % 400 == 0
                return true
            else 
                return false
            end
        else 
            return true
        end
    else return false
    end
end

println(isleap(2020)) # test function isleap

function chesscolor(cell1, cell2)
    column_num = 0
    if cell1 < 'a' || cell1 > 'h'
        return("Некорректный символ для столбца. Должен быть от 'a' до 'h'")
    end
    if cell2 < 1 || cell2 > 8
        return("Некорректное число для ряда. Должно быть от 1 до 8")
    end
    column_num = Int(cell1) - Int('a') + 1
    if (column_num + cell2) % 2 == 0
        return true
    else
        return false
    end
# true for black cells, false for white cells
end

println(chesscolor('c', 6)) # test function chesscolor