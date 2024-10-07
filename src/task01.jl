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
    for j in axes(vec_, 2)
        x = 0
        for i in axes(vec_, 1)
            x += abs(vec_[i, j])
        end
        if x > result
            result = x
        end
    end
    return result
end

A = rand(1:5, 10, 10)
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
    a = 0
    b = 0
    function check_cell(cell)
        column = 0
        row = 0
        column_num = 0
        if length(cell) != 2 || typeof(cell[1]) != Char ||  typeof(cell[2]) != Int
            return "Incorrect input of coordinates of the first cell.  A vector with a symbol and a number is expected"
        end
        column, row = cell[1], cell[2]
        if column < 'a' || column > 'h'
            return "Incorrect symbol for column.  Must be from 'a' to 'h'"
        end
        if row < 1 || row > 8
            return "Incorrect number for series.  Must be from 1 to 8"
        end
        column_num = Int(column) - Int('a') + 1
        if (column_num + row) % 2 == 0
            return true
        else
            return false
        end
    end

    a = check_cell(cell1)
    b = check_cell(cell2)

    if (a == true) && (b == true)
        return true
    elseif (a == false) && (b == false)
        return true
    else
        return false
    end
    
# true for black cells, false for white cells
end

println(chesscolor(['h',2], ['b',7])) # test function chesscolor