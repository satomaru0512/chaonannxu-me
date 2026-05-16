#!/bin/sh
#PBS -l select=1
#PBS -q P_030
#PBS -N  Nd_Zn1_-1
#PBS -l walltime=72:00:00
#PBS -M sato.ryo.s6@dc.tohoku.ac.jp
#PBS -m abe

cd $PBS_O_WORKDIR/Nd_Zn1_-1
module -s load oneapi/2023.2.0

mpirun -np 112 -ppn 112 -hostfile $PBS_NODEFILE /work/app/VASP6/vasp.6.5.1_cpu/bin/vasp_std > vasp.out 2> vasp.err
        
