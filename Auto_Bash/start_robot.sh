#!/bin/bash
/isaac-sim/python.sh lerobot/scripts/control_robot.py \
    --robot.type=walker_s2_sim \
    --control.type=teleoperate \
    --control.task=Part_Sorting \
    --control.fps=50 \
    --control.display_cameras=false \
    --control.teleop_time_s=100000000
