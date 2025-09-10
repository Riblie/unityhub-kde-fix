#!/bin/bash
echo "Installing gnome-keyring..."
sudo dnf install -y gnome-keyring 2>/dev/null || \
sudo pacman -S --noconfirm gnome-keyring 2>/dev/null || \
sudo apt-get install -y gnome-keyring 2>/dev/null

echo "Creating ~/.xprofile..."
cat > ~/.xprofile << 'EOF'
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GNOME_KEYRING_CONTROL
EOF

echo "Clearing old Unity Hub data..."
rm -rf ~/.config/UnityHub ~/.cache/UnityHub
secret-tool clear application unityhub 2>/dev/null || true

echo "Adding alias to ~/.bashrc..."
grep -q "XDG_CURRENT_DESKTOP=GNOME" ~/.bashrc || echo 'alias unityhub="XDG_CURRENT_DESKTOP=GNOME unityhub"' >> ~/.bashrc

echo "Creating fixed .desktop file..."
mkdir -p ~/.local/share/applications
cat > ~/.local/share/applications/unityhub.desktop << 'EOF'
[Desktop Entry]
Name=Unity Hub (Fixed for KDE)
Comment=Game engine and development platform
Exec=env XDG_CURRENT_DESKTOP=GNOME unityhub %U
Icon=unityhub
Terminal=false
Type=Application
Categories=Development;IDE;Game;
StartupWMClass=unityhub
EOF

update-desktop-database ~/.local/share/applications

echo "✅ Setup complete! Please log out and log back in, then run 'unityhub'."
