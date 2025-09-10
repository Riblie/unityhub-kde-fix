It's not official fix, just personal solution.

Unity Hub KDE Linux Fix
Fix persistent login/logout issues in Unity Hub on Linux with KDE Plasma. 

If you're using Unity Hub on Linux (especially Fedora, Arch, Ubuntu) with KDE Plasma, you may experience:

Being logged out every time you restart Unity Hub.
No “Remember me” option.
Error 51: InvalidToken after login.
This happens because Unity Hub (Electron) tries to use KWallet by default in KDE — which is incompatible.
This repository provides scripts to force Unity Hub to use gnome-keyring instead, ensuring your session is saved.

What this fix does
Installs gnome-keyring (if not present).
Disables KWallet interference via environment variable XDG_CURRENT_DESKTOP=GNOME.
Sets up gnome-keyring to auto-start on login via ~/.xprofile.
Clears corrupted Unity Hub cache and tokens.
Adds a convenient shell alias (unityhub) with the correct environment.
Creates a corrected .desktop launcher for KDE menu and desktop.
Supported Systems
Distributions: Fedora (100%), Arch Linux, Ubuntu, Debian, openSUSE, and most systemd-based distros.
Desktop Environments: Primarily tested on KDE Plasma, but may work on others.
Shell: Separate scripts for bash and zsh.
Unity Hub: Version 3.x (tested on 3.14+).

Installation & Usage:

1. git clone https://github.com/Riblie/unityhub-kde-fix.git
2. cd unityhub-kde-fix
3. For BASH users: 
chmod +x fix-unityhub.bash 
./fix-unityhub.bash
3.1. For ZSH users:
chmod +x fix-unityhub.zsh
./fix-unityhub.zsh
MIT License

