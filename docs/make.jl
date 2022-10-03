using TrackingFloats
using Documenter

DocMeta.setdocmeta!(TrackingFloats, :DocTestSetup, :(using TrackingFloats); recursive=true)

makedocs(;
    modules=[TrackingFloats],
    authors="JonasH <hanssonjonas96@gmail.com> and contributors",
    repo="https://github.com/JonasHansson96/TrackingFloats.jl/blob/{commit}{path}#{line}",
    sitename="TrackingFloats.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://JonasHansson96.github.io/TrackingFloats.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/JonasHansson96/TrackingFloats.jl",
    devbranch="main",
)
