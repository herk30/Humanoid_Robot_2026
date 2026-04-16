#!/bin/bash
echo "======================================================="
echo "Install Environment"
echo "======================================================="

WORKSPACE_DIR="$HOME/Humanoid_Challenge_2026"
BASELINE_DIR="$WORKSPACE_DIR/GlobalHumanoidRobotChallenge2026_Baseline"

mkdir -p "$WORKSPACE_DIR"
cd "$WORKSPACE_DIR"

echo "[1/3] Create IsaacSim.sh"
cat << 'EOF' > IsaacSim.sh
#!/bin/bash
cd ~/Humanoid_Challenge_2026/GlobalHumanoidRobotChallenge2026_Baseline/
sudo ./run.sh
EOF
chmod +x IsaacSim.sh

cd "$BASELINE_DIR"

cat << 'EOF' > download_assets.sh
#!/bin/bash
/isaac-sim/python.sh -c "from huggingface_hub import snapshot_download; snapshot_download(repo_id='UBTECH-Robotics/challenge2026_assets', repo_type='model', local_dir='./assets')"
EOF
chmod +x download_assets.sh

cat << 'EOF' > start_robot.sh
#!/bin/bash
/isaac-sim/python.sh lerobot/scripts/control_robot.py \
    --robot.type=walker_s2_sim \
    --control.type=teleoperate \
    --control.task=Packing_Box \
    --control.fps=30 \
    --control.display_cameras=false \
    --control.teleop_time_s=100000000

EOF
chmod +x start_robot.sh

echo "======================================================="
echo "   INSTALLATION COMPLETE! SYSTEM IS READY.          "
echo "======================================================="