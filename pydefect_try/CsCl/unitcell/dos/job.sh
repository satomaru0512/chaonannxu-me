#!/bin/sh
#PBS -l select=1:ncpus=10:mpiprocs=10
#PBS -q P_030
#PBS -N CsCl
#PBS -l walltime=72:00:00
#PBS -M sato.ryo.s6@dc.tohoku.ac.jp
#PBS -m abe


ELEMENT="CsCl"   
CALC_TYPE="dos"   

HOME_DIR="/home/ryoryo"
IN_DIR="${HOME_DIR}/pydefect_try/${ELEMENT}/unitcell/${CALC_TYPE}"

cd ${IN_DIR}

module load oneapi/2023.2.0
VASP_EXE=/work/app/VASP6/vasp.6.5.1_cpu/bin/vasp_std

mpirun -np 10 -ppn 10 -hostfile $PBS_NODEFILE $VASP_EXE > vasp.out 2> vasp.err