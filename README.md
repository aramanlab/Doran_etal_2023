# Subspecies phylogeny in the human gut revealed by coevolutionary constraints across the bacterial kingdom

[![analysis website](https://img.shields.io/badge/analysis-website-blue.svg)](https://aramanlab.github.io/Doran_etal_2023/)

## Initializing project

This code base is using the [Julia Language](https://julialang.org/) and
[DrWatson](https://juliadynamics.github.io/DrWatson.jl/stable/)
to make a reproducible scientific project named

> Doran_etal_2023

This project reproduces results from:

[Subspecies phylogeny in the human gut revealed by coevolutionary constraints across the bacterial kingdom](https://doi.org/10.1016/j.cels.2024.12.008)

To (locally) reproduce this project, do the following:

0. Download this code base.

   ```bash
   git clone --recurse-submodules git@github.com:aramanlab/Doran_etal_2023.git
   cd Doran_etal_2023
   ```
1. Open a Julia console and do:
   ```bash
   julia> # press ']' to enter package mode
   (1.10) pkg> add DrWatson # install globally, for using `quickactivate`
   (1.10) pkg> activate "path/to/this/project"
   (Doran_etal_2023) pkg> instantiate
   ```

This will install all necessary packages for you to be able to run the scripts and
everything should work out of the box, including correctly finding local paths.

You may notice that most scripts start with the commands:
```julia
using DrWatson
@quickactivate projectdir()
```
which auto-activates the project and enables local path handling from DrWatson.

## SpectralInference.jl

This project uses our labs custom package [SpectralInference.jl](https://github.com/aramanlab/SpectralInference.jl)

To use the package for your own projects, please look at its separate github project.

[https://github.com/aramanlab/SpectralInference.jl](https://github.com/aramanlab/SpectralInference.jl)
