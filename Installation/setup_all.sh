#!/bin/bash
echo "======================================================="
echo "Install Environment Scripts"
echo "======================================================="

WORKSPACE_DIR=$(pwd)
BASELINE_DIR="$WORKSPACE_DIR/GlobalHumanoidRobotChallenge2026_Baseline"

echo "[1/3] Create IsaacSim.sh (Shortcut to enter Docker)"
cat << EOF > IsaacSim.sh
#!/bin/bash
cd $BASELINE_DIR
sed -i 's/GHRC_2026/ghrc_2026/g' run.sh
sudo -E ./run.sh
EOF
chmod +x IsaacSim.sh

cd "$BASELINE_DIR" || { echo "Can't find Baseline!"; exit 1; }

echo "[2/3] Create download_assets.sh"
cat << 'EOF' > download_assets.sh
#!/bin/bash
/isaac-sim/python.sh -c "from huggingface_hub import snapshot_download; snapshot_download(repo_id='UBTECH-Robotics/challenge2026_assets', repo_type='model', local_dir='./assets')"
EOF
chmod +x download_assets.sh

echo "[3/3] Create start_robot.sh"
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
echo "   SCRIPTS GENERATION COMPLETE! SYSTEM IS READY.       "
echo "======================================================="
