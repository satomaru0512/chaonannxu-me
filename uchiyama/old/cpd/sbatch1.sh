#!/bin/sh
#PBS -l select=1
#PBS -q P_030
#PBS -N ZnOcpd1
#PBS -l walltime=10:00:00
#PBS -M sato.ryo.s6@dc.tohoku.ac.jp
#PBS -m abe

cd $PBS_O_WORKDIR

module -s load oneapi/2023.2.0

for dir in mol_O2 Zn_mp-79 ZnO_mp-2133 Na_mp-10172
do
    if [ -d "$dir" ]; then
        cd "$dir"
        
        mpirun -np 112 -ppn 112 -hostfile $PBS_NODEFILE /work/app/VASP6/vasp.6.5.1_cpu/bin/vasp_std > vasp.out 2> vasp.err
        
        cd $PBS_O_WORKDIR
    fi
done
