#!/bin/sh
#PBS -l select=1:ncpus=2:ngpus=2:mem=64gb
#PBS -q CA_001
#PBS -N oi0
#PBS -l walltime=12:00:00
#PBS -M tomoki.uchiyama.e8@tohoku.ac.jp
#PBS -m abe

cd $PBS_O_WORKDIR

module -s load nvhpc/25.3

for dir in O_i1_0
do
    if [ -d "$dir" ]; then
        cd "$dir"
        
        mpirun -np 2 -N 2 -hostfile $PBS_NODEFILE -x LD_LIBRARY_PATH /work/app/VASP6/vasp.6.5.1_gpu/bin/vasp_std > vasp.out 2> vasp.err
        
        cd $PBS_O_WORKDIR
    fi
done