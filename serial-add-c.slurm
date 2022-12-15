#! /bin/bash
#SBATCH --time=00:10:00 
#SBATCH -N 1 -n 1 # 1 Node and 1 processor
#SBATCH -p classc # CPU partition
#SBATCH -A sxg125_csds438 
#SBATCH --mem=8gb # Assign 8gb memory

module load gcc

cp addition.c $PFSDIR
cd $PFSDIR
gcc -o serial-add-c addition.c
time ./serial-add-c

cp -ru * $SLURM_SUBMIT_DIR