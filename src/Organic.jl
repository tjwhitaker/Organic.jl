module Organic

export parse

function parse(file::AbstractString)
    f = read(file, String)

    title = match(r"#+TITLE: (*.)", f)
    description = match(r"#+DESCRIPTION: (*.)", f)

    meta = Dict("title" => title, "description" => description)
    content = run(`pandoc $(file) -f org -t html`)

    return meta, content
end
