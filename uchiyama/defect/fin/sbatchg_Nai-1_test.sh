#!/bin/sh
#PBS -l select=1:ncpus=4:ngpus=4:mem=32gb
#PBS -q DA_002
#PBS -N -1
#PBS -l walltime=02:00:00
#PBS -M tomoki.uchiyama.e8@tohoku.ac.jp
#PBS -m abe

cd $PBS_O_WORKDIR

module -s load nvhpc/25.3

for dir in Na_i1_-1
do
    if [ -d "$dir" ]; then
        cd "$dir"
        
        mpirun -np 4 -N 4 -hostfile $PBS_NODEFILE -x LD_LIBRARY_PATH /work/app/VASP6/vasp.6.5.1_gpu/bin/vasp_std > vasp.out 2> vasp.err
        
        cd $PBS_O_WORKDIR
    fi
done