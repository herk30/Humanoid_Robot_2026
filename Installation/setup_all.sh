#!/bin/bash
echo "======================================================="
echo "Install Environment Scripts"
echo "======================================================="

<<<<<<< HEAD
# WORKSPACE_DIR=$(pwd)
# BASELINE_DIR="$WORKSPACE_DIR/GlobalHumanoidRobotChallenge_2026_Baseline"
cd $HOME/Code/GlobalHumanoidRobotChallenge_2026_Baseline
=======
WORKSPACE_DIR=$(pwd)
BASELINE_DIR="$WORKSPACE_DIR/GlobalHumanoidRobotChallenge_2026_Baseline"
>>>>>>> 78b76769bdd25484757f039a9f163a53659cec7c

echo "[1/7] Create IsaacSim.sh (Shortcut to enter Docker)"
cat << EOF > IsaacSim.sh
#!/bin/bash
cd $BASELINE_DIR
sed -i 's/GHRC_2026/ghrc_2026/g' run.sh
sudo -E ./run.sh
EOF
chmod +x IsaacSim.sh

cd "$BASELINE_DIR" || { echo "Can't find Baseline!"; exit 1; }

echo "[2/7] Create download_assets.sh"
cat << 'EOF' > download_assets.sh
#!/bin/bash
/isaac-sim/python.sh -c "from huggingface_hub import snapshot_download; snapshot_download(repo_id='UBTECH-Robotics/challenge2026_assets', repo_type='model', local_dir='./assets')"
EOF
chmod +x download_assets.sh

echo "[3/7] Create start_robot.sh"
cat << 'EOF' > start_robot.sh
#!/bin/bash
/isaac-sim/python.sh lerobot/scripts/control_robot.py \
    --robot.type=walker_s2_sim \
    --control.type=teleoperate \
    --control.task=Part_Sorting \
    --control.fps=50 \
    --control.display_cameras=false \
    --control.teleop_time_s=100000000
EOF
chmod +x start_robot.sh

echo "[4/7] Create DataCollection.sh"
cat << 'EOF' > DataCollection.sh
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
EOF
chmod +x DataCollection.sh

echo "[5/7] Create Replay.sh"
cat << 'EOF' > Replay.sh
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
EOF
chmod +x Replay.sh

echo "[6/7] Create Training.sh"
cat << 'EOF' > Training.sh
#!/bin/bash
/isaac-sim/python.sh lerobot/scripts/train.py \
  --dataset.repo_id=your_org/Packing_Box_dataset \
  --dataset.root=./challenge2026_dataset/Packing_Box/packing_box_episode_50 \
  --policy.type=act \
  --policy.n_obs_steps=1 \
  --policy.chunk_size=50 \
  --policy.n_action_steps=50 \
  --policy.vision_backbone=resnet18 \
  --policy.pretrained_backbone_weights=ResNet18_Weights.IMAGENET1K_V1 \
  --policy.dim_model=256 \
  --policy.n_heads=4 \
  --policy.dim_feedforward=1024 \
  --policy.n_encoder_layers=4 \
  --policy.n_decoder_layers=1 \
  --policy.use_vae=true \
  --policy.latent_dim=32 \
  --policy.n_vae_encoder_layers=4 \
  --policy.dropout=0.1 \
  --policy.kl_weight=10.0 \
  --policy.optimizer_lr=1e-5 \
  --policy.optimizer_weight_decay=1e-4 \
  --policy.optimizer_lr_backbone=1e-5 \
  --policy.device=cuda \
  --policy.use_amp=true \
  --output_dir=challenge2026_baseline/Packing_Box/act_001/ \
  --job_name=task4_act \
  --resume=false \
  --seed=1000 \
  --num_workers=8 \
  --batch_size=8 \
  --steps=100000 \
  --eval_freq=0 \
  --log_freq=200 \
  --save_checkpoint=true \
  --save_freq=5000 \
  --wandb.entity=your_wandb_entity
EOF
chmod +x Training.sh

echo "[7/7] Create Inference.sh"
cat << 'EOF' > Inference.sh
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
EOF
chmod +x Inference.sh   


echo "======================================================="
echo "   SCRIPTS GENERATION COMPLETE! SYSTEM IS READY.       "
echo "======================================================="
