#!/bin/bash
/isaac-sim/python.sh lerobot/scripts/control_robot.py \
    --robot.type=walker_s2_sim \
    --control.task=Packing_Box \
    --control.root=./datasets/Packing_Box/inference \
    --control.type=record \
    --control.policy.path=./challenge2026_baseline/Packing_Box/act/checkpoints/last/pretrained_model \
    --control.fps=30 \
    --control.single_task="Packing_Box" \
    --control.repo_id=your_org/eval_task4_act \
    --control.num_episodes=10 \
    --control.warmup_time_s=5 \
    --control.episode_time_s=2000 \
    --control.reset_time_s=10 \
    --control.push_to_hub=false \
    --control.video=true \
    --control.num_image_writer_threads_per_camera=4 \
    --control.display_cameras=true \
    --control.play_sounds=false \
    --control.resume=false
