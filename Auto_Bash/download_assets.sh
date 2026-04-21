#!/bin/bash
/isaac-sim/python.sh -c "from huggingface_hub import snapshot_download; snapshot_download(repo_id='UBTECH-Robotics/challenge2026_assets', repo_type='model', local_dir='./assets')"
