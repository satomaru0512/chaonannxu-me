#!/bin/sh
#PBS -l select=1:ncpus=2:ngpus=2:mem=32gb
#PBS -q CA_001
#PBS -N vaspgpu
#PBS -l walltime=1:00:00
#PBS -M kawahal@dc.tohoku.ac.jp
#PBS -m abe

IN_DIR="${PBS_O_WORKDIR}"

cd ${IN_DIR}

module -s load nvhpc/25.3
VASP_EXE=/work/app/VASP6/vasp.6.5.1_gpu/bin/vasp_std

mpirun -np 2 -N 2 -hostfile $PBS_NODEFILE -x LD_LIBRARY_PATH $VASP_EXE > vasp.out 2> vasp.err
