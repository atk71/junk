#! /bin/bash
#SBATCH --time=00:10:00 
#SBATCH -p class # GPU partition
#SBATCH --gres=gpu:1
#SBATCH -A sxg125_csds438 
#SBATCH --mem=8gb # Assign 8gb memory

module load gcc
module load cuda/10.0

cp cuda_addition.cu $PFSDIR
cd $PFSDIR
nvcc -o cuda_addition cuda_addition.cu
time ./cuda_addition
echo "benchmarked gpu-add-cuda"
cp -ru * $SLURM_SUBMIT_DIR