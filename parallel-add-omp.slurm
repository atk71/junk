#! /bin/bash
#SBATCH --time=00:10:00 
#SBATCH -N 2 -n 4 -c 4
#SBATCH -p classc # CPU partition
#SBATCH -A sxg125_csds438 
#SBATCH --mem=8gb # Assign 8gb memory

module load gcc

cp omp_addition.c $PFSDIR
cd $PFSDIR
gcc -o omp_addition -fopenmp omp_addition.c
time ./omp_addition
echo "benchmarked parallel-add-omp"
cp -ru * $SLURM_SUBMIT_DIR