#! /bin/bash
#SBATCH --time=00:10:00 
#SBATCH -p class # GPU partition
#SBATCH --gres=gpu:1
#SBATCH -A sxg125_csds438 
#SBATCH --mem=8gb # Assign 8gb memory

module load pgi/20.1
module load cuda/10.0

cp acc_addition.c $PFSDIR
cd $PFSDIR
pgcc -acc -ta=tesla:cc70 -Minfo=accel -o acc_addition acc_addition.c
time ./acc_addition
echo "benchmarked gpu-add-acc"
cp -ru * $SLURM_SUBMIT_DIR