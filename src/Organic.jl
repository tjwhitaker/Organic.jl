module Organic

export parse

function parse(file::AbstractString)
    f = read(file, String)

    title = match(r"#\+TITLE: (.*)", f).captures[1]
    description = match(r"#\+DESCRIPTION: (.*)", f).captures[1]
    slug = split(split(file, "/")[end], ".")[1]

    meta = Dict("title" => title, "description" => description, "slug" => slug)
    content = read(`pandoc $(file) --katex -f org -t html`, String)
    return meta, content
end

end
