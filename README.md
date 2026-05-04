Markdown# Raspberry Pi 4B + DietPi + UCTronics OLED Stats Display

![DietPi](https://img.shields.io/badge/DietPi-OS-blue?style=flat-square)
![Raspberry Pi](https://img.shields.io/badge/Raspberry%20Pi-4B-red?style=flat-square)
![OLED](https://img.shields.io/badge/OLED-SSD1306-orange?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

**Complete, lightweight setup** for displaying real-time system statistics on the **UCTronics OLED display (U6143 SSD1306)** using **DietPi OS** on a Raspberry Pi 4B with UCTronics PoE Rack.

---

## ✨ Features

- Automatic system stats display on boot (CPU, RAM, Temperature, Uptime, etc.)
- Uses official UCTronics C program
- Powered by **DietPi Autostart** (clean & reliable)
- Minimal resource usage — perfect companion for Pi-Hole
- Fully cleaned and optimized system

---

## 📋 Hardware

- **Raspberry Pi 4B**
- **UCTronics RPi Rack** with PoE HAT
- **UCTronics OLED Display** (SSD1306, 128x64, I2C)

---

## 🚀 Quick Start

### 1. Enable I2C
```bash
sudo dietpi-config
→ Go to 7: Advanced Options → I2C State → Enabled → Reboot
Verify I2C device:
Bashsudo i2cdetect -y 1
You should see address 0x3C (or 0x3D).
2. Install Dependencies & Compile
Bashsudo apt update
sudo apt install -y build-essential libi2c-dev git

cd /home/dietpi
git clone https://github.com/UCTRONICS/U6143_ssd1306.git

cd U6143_ssd1306/C
sudo make clean && sudo make
Test the display manually:
Bashsudo ./display
Press Ctrl + C to exit.
3. Setup Automatic Boot (DietPi Autostart)
Bashsudo dietpi-autostart
→ Select 16: Custom Script
Create the autostart script:
Bashsudo nano /var/lib/dietpi/dietpi-autostart/custom.sh
Content to paste:
Bash#!/bin/bash
# =============================================
# UCTronics OLED Display - DietPi Autostart
# =============================================

cd /home/dietpi/U6143_ssd1306/C

# Optional: Recompile only if you modify the code
# sudo make clean && sudo make

# Start the OLED display program
sudo ./display &
Make executable and reboot:
Bashsudo chmod +x /var/lib/dietpi/dietpi-autostart/custom.sh
sudo reboot

🧹 Cleanup - Make It Minimal
Bash# Remove development tools
sudo apt remove --purge -y git build-essential
sudo apt autoremove -y
sudo apt autoclean

# Optional: Keep only the compiled binary
cd /home/dietpi/U6143_ssd1306/C
sudo make clean
find . -type f ! -name 'display' -delete

🔧 Troubleshooting

























IssueSolutionOLED stays blankRun sudo i2cdetect -y 1Wrong I2C addressEdit main.c, change address, then recompileDisplay doesn't startTest manually: sudo /var/lib/dietpi/dietpi-autostart/custom.shView boot logssudo journalctl -b | grep custom

📁 Repository Structure
Bashrpi-dietpi-uctronics-oled/
├── README.md
├── custom.sh                 # Backup of autostart script
├── photos/                   # Add your OLED screenshots here
└── LICENSE

📸 Screenshots
(Add photos of your working OLED in the photos/ folder)

🔗 References

UCTronics Official GitHub
DietPi Documentation
DietPi Autostart Tool


Made with ❤️ for the Raspberry Pi and DietPi community.
Last updated: May 2026