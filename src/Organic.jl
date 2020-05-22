module Organic

export parse

function parse(file::AbstractString)
    meta = Dict("test" => 1)
    content = run(`pandoc $(file) -f org -t html`)

    return meta, content
end
