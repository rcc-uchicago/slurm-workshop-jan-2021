#!/bin/bash

#SBATCH --job-name=compute_cov
#SBATCH --partition=broadwl
#SBATCH --reservation=slurm_workshop
#SBATCH --time=00:10:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G

# Get the command-line arguments.
M=${1}

# For reproducibility, add version numbers to the "module load" calls.
module load R/3.6.1

# Tell OpenBLAS to use 4 threads.
export OPENBLAS_NUM_THREADS=4

# Run the R script.
echo "Running compute_cov.R ${M}"
OUTFILE=compute_cov_${M}.Rout
Rscript compute_cov.R ${M} > ${OUTFILE}
