# Humanoid Robot 2026
## This is Humanoid Robot Installation Instruction
>🔴 Make sure that you're using Ubuntu or linux-related Operating System

- Clone the project repository:
```bash
git clone https://github.com/herk30/Humanoid_Robot_2026.git
```
- Then Enter **Installation** folder
- First, ensure that your system meets all the hardware and software requirements before running the simulation.
## 🛠️ 1. Prerequisites (HostMachine)
- This project relies on NVIDIA Isaac Sim running inside a Docker container. 
- You **must** have the following installed on your host Ubuntu machine: 
	* **NVIDIA Driver** (Compatible with your GPU, e.g., RTX 4060) 
	* **Docker Engine** 
	* **NVIDIA Container Toolkit** (To enable GPU pass-through to Docker) 
- Use the `install_prerequisites.sh` script provided in the repository to automatically set up these environments
```
chmod +x install_prerequisites.sh
./install_prerequisites.sh
```
⚠️You **MUST RESTART** your computer after this step for the NVIDIA Driver to take effect. After rebooting, open a terminal and type `nvidia-smi` to make sure your GPU is recognized by the system.
## ⚙️ 2. Generate Shortcut Scripts
- Run the setup script to generate all necessary shortcuts for your workspace: 
```
chmod +x  setup_all.sh
./setup_all.sh
```

## 🐳 3. Enter the Docker Environment 
- Do not run the Python scripts directly on your host machine. 
- Start and enter the isolated Docker container by running: 
```
chmod +x IsaacSim.sh
./IsaacSim.sh
```
## 4. Download 3D assets
- Inside Docker container, run following command to download the warehouse, tables, and robot models:
```
chmod +x download_assets.sh
./download_assets.sh
```

## 🚀 5. Launch the Teleoperation System
- Once the assets are fully downloaded, you can start the Isaac Sim environment and take control of the robot. Run the automated startup script:
```
chmod +x start_robot.sh
./start_robot.sh
```
## **⚠️ Important Note on Physics Loading:** 
- When the 3D window appears, **wait 3-5 seconds** before pressing any control keys. 
- Allow the simulation to fully load the robot's articulation and physics to prevent `NoneType` joint position errors.

