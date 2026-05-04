# Raspberry Pi 4B + DietPi + UCTronics OLED Stats Display

Complete guide for running system statistics on the **UCTronics OLED display** (U6143 SSD1306) using **DietPi OS** on a Raspberry Pi 4B inside a UCTronics PoE Rack.

![OLED Display](photos/oled-display.jpg)  
*(Add your photo here later)*

## ✨ Project Goals
- Lightweight DietPi installation
- Automatic OLED stats display on boot using **DietPi Autostart**
- Clean, minimal system (no unnecessary packages)
- Fully documented setup and cleanup process
- Reproducible and shareable

## 🛠️ Hardware Used
- Raspberry Pi 4B
- UCTronics RPi Rack + PoE HAT
- UCTronics OLED Display (SSD1306, 128x64, I2C)

## 📋 Features
- Shows CPU usage, RAM, temperature, uptime, etc.
- Starts automatically on boot
- Uses official UCTronics C program
- Optimized for low resource usage (ideal with Pi-Hole)

---

## 🚀 Step-by-Step Setup

### 1. Enable I2C on DietPi

sudo dietpi-config


### Go to 7: Advanced Options → I2C State → Enabled
Reboot the Pi

## Verify I2C:


sudo i2cdetect -y 1


You should see address 0x3C (or 0x3D).

# Install Required Packages
sudo apt update
sudo apt install -y build-essential libi2c-dev git


# Download and Compile UCTronics OLED Code
cd /home/dietpi
git clone https://github.com/UCTRONICS/U6143_ssd1306.git

cd U6143_ssd1306/C
sudo make clean && sudo make


Test the display manually:
sudo ./display


Press Ctrl + C to stop.
# Configure DietPi Autostart (Working Method)
Run:


sudo dietpi-autostart


→ Select 16: Custom Script
Create the autostart script:
sudo nano /var/lib/dietpi/dietpi-autostart/custom.sh


Paste this content:
#!/bin/bash
# =============================================
# UCTronics OLED Display - DietPi Autostart
# =============================================

cd /home/dietpi/U6143_ssd1306/C

# Optional: Recompile only if you change the code
# sudo make clean && sudo make

# Start the display program in background
sudo ./display &


Make it executable:
sudo chmod +x /var/lib/dietpi/dietpi-autostart/custom.sh


Reboot and test:
sudo reboot


Cleanup - Minimal System
After everything is working, remove unnecessary packages:
sudo apt remove --purge -y git build-essential
sudo apt autoremove -y
sudo apt autoclean

# Optional: Keep only the compiled binary (saves space)
cd /home/dietpi/U6143_ssd1306/C
sudo make clean
find . -type f ! -name 'display' -delete


🔧 Troubleshooting

ProblemSolutionOLED is blankRun sudo i2cdetect -y 1Wrong I2C addressEdit main.c then recompileDisplay not startingCheck script: sudo /var/lib/dietpi/dietpi-autostart/custom.shCheck logssudo journalctl -b | grep custom
=======
# rpi-dietpi-uctronics-oled
DietPi setup for Raspberry Pi 4B with UCTronics PoE Rack + OLED display showing system stats (CPU, RAM, temp, etc.)
>>>>>>> eeefbe874e5fc7e18ec8af16f7450a960bb67894
