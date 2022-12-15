#! /bin/bash
#SBATCH --time=00:10:00 
#SBATCH -N 2 -c 4
#SBATCH -p classc # CPU partition
#SBATCH -A sxg125_csds438 
#SBATCH --mem=8gb # Assign 8gb memory

module load gcc

cp mpi_addition.c $PFSDIR
cd $PFSDIR
mpicc -o mpi_addition mpi_addition.c
time ./mpi_addition
echo "benchmarked parallel-add-mpi"
cp -ru * $SLURM_SUBMIT_DIR