#!/bin/bash
/isaac-sim/python.sh lerobot/scripts/control_robot.py \
    --robot.type=walker_s2_sim \
    --control.type=replay \
    --control.task=Part_Sorting \
    --control.root=./challenge2026_dataset/Part_Sorting/v1 \
    --control.repo_id=your_org/Part_Sorting \
    --control.episode=10 \
    --control.fps=50 \
    --control.play_sounds=false
