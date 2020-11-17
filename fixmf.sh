#!/bin/bash
echo "**********************************************************************************"
echo "                        Fix Media Foundation DLL issue                            "
echo "**********************************************************************************"
read -p 'Enter the full path to your steamapps folder inside your steam library folder: ' steamapps
read -p 'Enter the app id of the game you want to fix the Media Foundation DLL: ' appid
export WINEARCH=win64
export WINEPREFIX="$steamapps/compatdata/$appid/pfx"
export PROTON="$steamapps/common/Proton 5.0/"
cd ~/Downloads
git clone https://github.com/z0z0z/mf-install
cd mf-install
WINEPREFIX="$steamapps/compatdata/$appid/pfx" ./mf-install.sh --proton
cd ..
git clone https://github.com/z0z0z/mf-installcab
cd mf-installcab
WINEPREFIX="$steamapps/compatdata/$appid/pfx" ./install-mf-64.sh

rm -r ~/Downloads/mf-install
rm -r ~/Downloads/mf-installcab

echo "All done now your game should be working fine"
