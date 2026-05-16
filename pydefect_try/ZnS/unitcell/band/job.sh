#!/bin/sh
#PBS -l select=1:ncpus=2:ngpus=2:mem=128gb
#PBS -q CA_001
#PBS -N vasp_job         
#PBS -l walltime=1:00:00
#PBS -M sato.ryo.s6@dc.tohoku.ac.jp
#PBS -m abe

# IN_DIRの設定をより確実に（カレントディレクトリを使用）
cd ${PBS_O_WORKDIR}

# モジュールのロード
module -s load nvhpc/25.3
VASP_EXE=/work/app/VASP6/vasp.6.5.1_gpu/bin/vasp_std

# GPU実行時は -np 2 (GPU数と同じ) でOK
mpirun -np 2 $VASP_EXE > vasp.out 2> vasp.err