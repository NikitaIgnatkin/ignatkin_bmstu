export getdigits, touppercase, firstnorm, secondnorm, infnorm, isleap, chesscolor

function getdigits(a)
    B = Int[]
    while a !=0
        c = mod(a,10)
        push!(B,c) 
        a = div(a,10) 
    end
    return B[end:-1:1]
end

function touppercase(str_)
    result = ""
    for symb in str_
        if 'a' <= symb <= 'z'
            symb = Char(Int(symb) - 32)
        end
        result *=  symb
    end
    return result
end

function firstnorm(vec_::AbstractVector{<:Number})
    n1=0
    for n in vec_
        n1 += abs(n)
    end
    return n1;
end

function secondnorm(vec_::AbstractVector{<:Number})
    n2=0
    for n in vec_
        n2 += n^2
    end
    return sqrt(n2);
end

function infnorm(vec_::AbstractVector{<:Number})
    n3 = 0
    for n in vec_
        if n > n3
            n3=n
        end
    end
    return n3;
end

function firstnorm(mat_::AbstractMatrix{<:Number})
    a = zero(eltype(mat_)) 
    
    for n in eachcol(mat_)
        buf = sum(n)
        a = max(a, buf)
    end

    return a
end

function infnorm(mat_::AbstractMatrix{<:Number})
    a = zero(eltype(mat_))
    
    for n in eachrow(mat_)
        buf = sum(n)
        a = max(a, buf)
    end

    return a
end

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
    else
            return false
    end
end

function chesscolor(cell1, cell2)
    buf1 = cell1[1] - 'a'+1
    buf2 = cell2[1] - 'a'+1
    color1 = (buf1+cell1[2]) % 2 == 0
    color2 = (buf2+cell2[2]) % 2 == 0
    return color1 == color2 
end