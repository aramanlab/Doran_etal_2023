# An evolution-based framework for describing human gut bacteria

[![analysis website](https://img.shields.io/badge/analysis-website-blue.svg)](https://aramanlab.github.io/Doran_etal_2023/)

## Initalizing project

This code base is using the [Julia Language](https://julialang.org/) and
[DrWatson](https://juliadynamics.github.io/DrWatson.jl/stable/)
to make a reproducible scientific project named
> Doran_etal_2023

To (locally) reproduce this project, do the following:

0. Download this code base.
   ```
   git clone git@github.com:aramanlab/Doran_etal_2023.git
   cd Doran_etal_2023
   git submodule init
   ```
1. Open a Julia console and do:
   ```
   julia> using Pkg
   julia> Pkg.add("DrWatson") # install globally, for using `quickactivate`
   julia> Pkg.activate("path/to/this/project")
   julia> Pkg.instantiate()
   ```

This will install all necessary packages for you to be able to run the scripts and
everything should work out of the box, including correctly finding local paths.

You may notice that most scripts start with the commands:
```julia
using DrWatson
@quickactivate projectdir()
```
which auto-activates the project and enables local path handling from DrWatson.
