#!/usr/bin/env bash
if [[ $1 == "ref" ]]; then
    sched=2
else
    if [[ $1 == "naive" ]]; then
        export HL_AUTO_NAIVE=1
    elif [[ $1 == "sweep" ]]; then
        export HL_AUTO_SWEEP=1 HL_AUTO_PARALLELISM=6 HL_AUTO_VEC_LEN=16 HL_AUTO_BALANCE=5 HL_AUTO_FAST_MEM_SIZE=131072
    fi
    sched=-1
fi
OMP_NUM_THREADS=$2 HL_NUM_THREADS=$2 ./interpolate ../images/rgba.png out.png $sched
