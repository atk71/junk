#! /bin/bash

sbatch serial-add-c.slurm
sbatch serial-add-py.slurm
sbatch serial-add-jit.slurm
sbatch parallel-add-omp.slurm
sbatch parallel-add-mpi.slurm
sbatch gpu-add-acc.slurm
sbatch gpu-add-cuda.slurm