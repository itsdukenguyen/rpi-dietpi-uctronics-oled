# Raspberry Pi 4B + DietPi + UCTronics OLED Stats Display

A complete, lightweight setup guide for running system statistics (CPU, RAM, temperature, etc.) on the **UCTronics OLED display** (U6143 SSD1306) with **DietPi OS** on a Raspberry Pi 4B inside a UCTronics PoE Rack.

![OLED Display Example](oled-example.jpg) <!-- Add a photo later -->

## ✨ Features
- Automatic OLED stats display on boot via **DietPi Autostart**
- Clean, minimal DietPi installation
- I2C enabled
- Compiled C binary from official UCTronics repo
- Fully documented cleanup steps
- Tested on DietPi with Pi-Hole

## 📋 Hardware
- Raspberry Pi 4B
- UCTronics RPi Rack with PoE HAT
- UCTronics OLED display (SSD1306, 128x64, I2C)

## 🛠️ Step-by-Step Setup

### 1. Enable I2C
```bash
sudo dietpi-config
```

→ 7: Advanced Options → I2C State → Enabled → Reboot

Verify:
```bash
sudo i2cdetect -y 1
```

You should see 0x3C (or similar).
### 2. Install Dependencies
```bash
sudo apt update
sudo apt install -y build-essential libi2c-dev i2c-tools git
```

### 3. Clone & Compile UCTronics Code
```bashcd /home/dietpi
git clone https://github.com/UCTRONICS/U6143_ssd1306.git

cd U6143_ssd1306/C
sudo make clean && sudo make
```

Test manually:
```bash
sudo ./display
```

### 4. Configure DietPi Autostart (Recommended)
```bash
sudo dietpi-autostart
```

→ Choose 16: Custom Script
Create the script:
```bash
sudo nano /var/lib/dietpi/dietpi-autostart/custom.sh
```

