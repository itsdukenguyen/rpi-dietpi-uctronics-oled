# Raspberry Pi 4B + DietPi + UCTronics OLED Stats Display

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

---

## 📋 Hardware

- **Raspberry Pi 4B**
- **UCTronics RPi Rack** with PoE HAT
- **UCTronics OLED Display** (SSD1306, 128x64, I2C)

---

## 🚀 Quick Start

```bash
sudo dietpi-config
```

### 1. Enable I2C

→ Go to 7: Advanced Options → I2C State → Enabled → Reboot
Verify I2C device:

sudo i2cdetect -y 1