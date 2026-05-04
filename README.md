# Raspberry Pi 4B + DietPi + UCTronics OLED Stats Display

<image-card alt="DietPi" src="https://img.shields.io/badge/DietPi-OS-blue?style=flat-square" ></image-card>
<image-card alt="Raspberry Pi" src="https://img.shields.io/badge/Raspberry%20Pi-4B-red?style=flat-square" ></image-card>
<image-card alt="OLED" src="https://img.shields.io/badge/OLED-SSD1306-orange?style=flat-square" ></image-card>
<image-card alt="License" src="https://img.shields.io/badge/License-MIT-green?style=flat-square" ></image-card>

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