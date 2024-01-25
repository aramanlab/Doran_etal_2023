function match_column_order(mtx::AbstractMatrix, cnames_src, cnames_dst)
    # make destination matrix
    dstmtx = zeros(eltype(mtx), size(mtx, 1), length(cnames_dst))

    # find matching columns
    rawidxs = indexin(cnames_src, cnames_dst)
    mask = .!isnothing.(rawidxs)
    matchedcols = filter(x->.!isnothing.(x), rawidxs)
    
    # set values where we have matched columns
    dstmtx[:, matchedcols] .= mtx[:, mask]
    return dstmtx
end

function lastline(io)
    local line
    for l in eachline(io)
        line = l
    end
    line
end

nthparent(n, i) = i < 1 ? n : nthparent(parent(n), i-1)
rename_treeleaves!(tree, idmapping) = begin
    for node in getleaves(tree)
        NewickTree.setname!(node, idmapping[name(node)])
    end
    tree
end

function writephylip(filename, M::AbstractVector{<:AbstractString}, ids)
    format_id(s) = rpad(s, 10)[1:10]
    n = length(M)
    m = length(first(M))
    open(filename, "w") do io
        println(io, string(n), " ", string(m))
        for (id, seq) in zip(ids, M)
            print(io, format_id(id), "    ")
            println(io, seq)
        end
    end
end


function show_svg(path) 
    open(path) do io
        s = read(io, String)
        display(MIME("image/svg+xml"), s)
    end
end

getlims(x) = extrema(x) |> x->abs.(x) |> maximum |> x->(-x, x)
function getlims(x, y) 
    lims = extrema(vcat(x, y))
    lims =  lims .+ (-(lims[2] - lims[1]) * 0.1, (lims[2] - lims[1]) * 0.1)
end