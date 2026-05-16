#!/bin/bash
#PBS -l select=1:ncpus=2:ngpus=2:mem=128gb
#PBS -q CA_001
#PBS -N vasp_batch
#PBS -l walltime=10:00:00
#PBS -M sato.ryo.s6@dc.tohoku.ac.jp
#PBS -m abe
#PBS -j oe

# --- 環境設定 ---
# 実行時のカレントディレクトリに移動（必須）
cd "${PBS_O_WORKDIR}"

module -s load nvhpc/25.3
VASP_EXE=/work/app/VASP6/vasp.6.5.1_gpu/bin/vasp_std

# 計算対象ディレクトリを自動取得（カレントディレクトリ内の全ディレクトリ）
DIRS=$(find . -maxdepth 1 -type d ! -name "." | sort)

# --- ループ処理開始 ---
for TARGET in $DIRS; do
    echo "==========================================="
    echo "Processing: $TARGET"
    echo "Started at: $(date)"
    echo "==========================================="
    
    # 各ディレクトリへ移動（移動できない場合はスキップ）
    cd "${PBS_O_WORKDIR}/${TARGET}" || continue

    # VASPの実行（標準出力と標準エラーを個別に保存）
    mpirun -np 2 $VASP_EXE > vasp.out 2> vasp.err

    echo "Completed: $TARGET at $(date)"
    
    # 念のため元のディレクトリに戻る
    cd "${PBS_O_WORKDIR}"
done

echo "All jobs finished successfully."