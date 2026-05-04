#!/bin/bash
# ================================================================
# UCTronics OLED Setup Script for DietPi on Raspberry Pi 4B
# Repository: rpi-dietpi-uctronics-oled
# ================================================================

set -e

echo -e "\e[1;36mUCTronics OLED Installer for DietPi\e[0m"
echo "========================================"

# Check root
if [[ $EUID -ne 0 ]]; then
   echo -e "\e[1;31mError: This script must be run as root (use sudo)\e[0m"
   exit 1
fi

# Check DietPi
if [[ ! -f /boot/dietpi/.version ]]; then
   echo -e "\e[1;33mWarning: DietPi not detected. Continuing anyway...\e[0m"
fi

echo -e "\n\e[1;33mStep 1/6: Installing dependencies...\e[0m"
apt update
apt install -y build-essential libi2c-dev i2c-tools git

echo -e "\n\e[1;33mStep 2/6: Enabling I2C...\e[0m"
if command -v dietpi-config >/dev/null 2>&1; then
    echo "Please enable I2C manually in dietpi-config if not already enabled."
    echo "Run: sudo dietpi-config → 7 Advanced Options → I2C State → Enabled"
else
    echo "dietpi-config not found. Enable I2C manually."
fi

echo -e "\n\e[1;33mStep 3/6: Cloning / Updating UCTronics repository...\e[0m"
cd /home/dietpi
if [ -d "U6143_ssd1306" ]; then
    echo "Repository exists. Pulling latest changes..."
    cd U6143_ssd1306 && git pull
else
    git clone https://github.com/UCTRONICS/U6143_ssd1306.git
fi

echo -e "\n\e[1;33mStep 4/6: Compiling display program...\e[0m"
cd /home/dietpi/U6143_ssd1306/C
make clean >/dev/null 2>&1 || true
make
chmod +x display

echo -e "\n\e[1;33mStep 5/6: Creating DietPi Autostart script...\e[0m"
cat > /var/lib/dietpi/dietpi-autostart/custom.sh << 'EOF'
#!/bin/bash
# UCTronics OLED Display - DietPi Autostart
cd /home/dietpi/U6143_ssd1306/C
sudo ./display &
EOF

chmod +x /var/lib/dietpi/dietpi-autostart/custom.sh

echo -e "\n\e[1;33mStep 6/6: Finalizing...\e[0m"
echo "Setup completed successfully!"

echo -e "\n\e[1;32m✅ OLED should now start automatically on next boot.\e[0m"
read -p "Reboot now? (y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    reboot
fi