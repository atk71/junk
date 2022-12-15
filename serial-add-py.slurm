#! /bin/bash
#SBATCH --time=00:10:00 
#SBATCH -N 1 -n 1 # 1 Node and 1 processor
#SBATCH -p classc # CPU partition
#SBATCH -A sxg125_csds438 
#SBATCH --mem=8gb # Assign 8gb memory

module load python

cp addition.py $PFSDIR
cd $PFSDIR

echo "timing serial-add-py"
time python addition.py
cp -ru * $SLURM_SUBMIT_DIR