# Humanoid Robot 2026
## This is Humanoid Robot Installation Instruction
### 🔴 Make sure that you're using Ubuntu or linux-related Operating System

- Git clone the project and using 
```
git clone https://github.com/herk30/Humanoid_Robot_2026.git
```
- Then Enter **Installation** folder
- 
- First, ensure that your system meets all the hardware and software requirements before running the simulation.
## 🛠️ 1. Prerequisites 
- This project relies on NVIDIA Isaac Sim running inside a Docker container. 
- You **must** have the following installed on your host Ubuntu machine: 
	* **NVIDIA Driver** (Compatible with your GPU, e.g., RTX 4060) 
	* **Docker Engine** 
	* **NVIDIA Container Toolkit** (To enable GPU pass-through to Docker) 
- Use the `install_prerequisites.sh` script provided in the repository to automatically set up these environments
```
./install_prerequisites.sh
```
## 🐳 2. Enter the Docker Environment 
- Do not run the Python scripts directly on your host machine. 
- Start and enter the isolated Docker container by running: 
```
bash sudo ./run.sh
```
## 3. Download 3D assets
- Inside Docker container, run following command to download 
```
/isaac-sim/python.sh -c "from huggingface_hub import snapshot_download; snapshot_download(repo_id='UBTECH-Robotics/challenge2026_assets', repo_type='model', local_dir='./assets')"
```
## 4. Shortcut to run IsaacSim after installation
- Go to `setup_all.sh` script provided to automatically run IsaacSim 
```
./setup_all.sh
```
## 🚀 5. Launch the Teleoperation System
- Once the assets are fully downloaded, you can start the Isaac Sim environment and take control of the robot. Run the automated startup script:
```
./start_robot.sh
```
## **⚠️ Important Note on Physics Loading:** 
- When the 3D window appears, **wait 3-5 seconds** before pressing any control keys. 
- Allow the simulation to fully load the robot's articulation and physics to prevent `NoneType` joint position errors.

