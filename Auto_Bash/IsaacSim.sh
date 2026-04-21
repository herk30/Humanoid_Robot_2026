#!/bin/bash
cd 
sed -i 's/GHRC_2026/ghrc_2026/g' run.sh
sudo -E ./run.sh
