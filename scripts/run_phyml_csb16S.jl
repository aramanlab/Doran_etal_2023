#!/usr/bin/env sh
#SBATCH --job-name=runPhyML
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=0-36:00:00
#SBATCH --mem-per-cpu=4G
#=
module load julia/1.9.0
srun julia --project=@. $(scontrol show job $SLURM_JOBID | awk -F= '/Command=/{print $2}')
exit
# =#
using DrWatson
@quickactivate projectdir()
using PhyML_jll
using NewickTree
using SpectralInference


inputfile = datadir("exp_raw", "BB669", "BB669_16S.phy")
outputdir = projectdir("_research", "BB669_16S_phyml") |> mkpath

cp(inputfile, joinpath(outputdir, basename(inputfile)), force=true)

@info "Starting PhyML on BB669_16S"
@time begin
    run(pipeline(`$(phyml()) \
        -dnt -mHKY85 -fe \
        -i $(joinpath(outputdir, basename(inputfile))) \
        -o tlr \
        --search SPR \
        --r_seed 123456 \
        --rand_start \
        --n_rand_starts 3 \
        --no_memory_check \
        --bootstrap -4`, # SH like branch supports
    stdout=joinpath(outputdir, "BB669_16S" * "_phyml.out")))
end # time phyml

mv(joinpath(outputdir, basename(inputfile) * "_phyml_tree.txt"),
   joinpath(outputdir, basename(inputfile) * "-supporttree.txt")
)

tree = readnw(readline(joinpath(outputdir, basename(inputfile) * "-supporttree.txt")));
ladderize!(tree)
writenw(joinpath(outputdir, basename(inputfile) * "-supporttree_multi.txt"), as_polytomy(n->NewickTree.support(n)<.5, tree))
