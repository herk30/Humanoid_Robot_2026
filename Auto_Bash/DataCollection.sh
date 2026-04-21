#!/bin/bash
/isaac-sim/python.sh lerobot/scripts/control_robot.py \
    --robot.type=walker_s2_sim \
    --control.root=/workspace/GlobalHumanoidRobotChallenge_2026_Baseline/datasets/Packing_Box/v1 \
    --control.type=record \
    --control.task=Part_Sorting \
    --control.fps=50 \
    --control.single_task="Part_Sorting" \
    --control.repo_id=your_org/your_dataset \
    --control.num_episodes=50 \
    --control.warmup_time_s=0 \
    --control.episode_time_s=10000 \
    --control.reset_time_s=10 \
    --control.push_to_hub=false \
    --control.video=true \
    --control.num_image_writer_threads_per_camera=4 \
    --control.display_cameras=true \
    --control.play_sounds=false \
    --control.resume=false
