#!/bin/bash
# mrbvrz - https://hasansuryaman.com
# this is part of my basic bash learning, there may be errors in writing this program.

# Colors Variables
RESTORE='\033[0m'
RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LGRAY='\033[00;37m'
LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'

# Destination directory
# ROOT_UID=0
: "${FONTS_DIR:="$HOME/.local/share/fonts"}"
: "${DEST_DIR:="$FONTS_DIR/Microsoft/TrueType/Segoe UI/"}"

# if [ "$UID" -eq "$ROOT_UID" ]; then
#  DEST_DIR="/usr/local/share/fonts/Microsoft/TrueType/Segoe UI/"
# else
#  DEST_DIR="$HOME/.local/share/fonts/Microsoft/TrueType/Segoe UI/"
# fi

# Check Internet Connection
function check_internet() {
    echo -e "$BLUE [ * ] Checking for internet connection"
    sleep 1
    echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo -e "$RED [ X ]$BLUE Internet Connection ➜$RED OFFLINE!\n";
        echo -e "$RED Sorry, you really need an internet connection..."
        exit 0
    else
        echo -e "$GREEN [ ✔ ]$BLUE Internet Connection ➜$GREEN CONNECTED!\n";
        sleep 1
    fi
}

function check_wget() {
    echo -e "$BLUE [ * ] Checking for Wget"
    sleep 1
    which wget > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo -e "$GREEN [ ✔ ]$BLUE Wget ➜$GREEN INSTALLED!\n"
        sleep 1
    else
        echo -e "$RED [ X ]$BLUE Wget ➜$RED NOT INSTALLED!\n"
        continue_wget
    fi
}

function check_font() {
    echo -e "$BLUE [ * ] Checking for Segoe-UI Font"
    sleep 1
    fc-list | grep -i "Segoe UI" >/dev/null 2>&1
    if [ "$?" -eq "0" ]
    then
        echo -e "$GREEN [ ✔ ]$BLUE Segoe-UI Font ➜$GREEN INSTALLED!\n"
        sleep 1
    else
        echo -e "$RED [ X ]$BLUE Segoe-UI Font ➜$RED NOT INSTALLED!\n"
        continue_font
    fi

    if [ ! -d "$DEST_DIR" ]
    then
        echo -e "$RED [ X ]$RED It seems the Segoe-UI Font is installed, but the directory '$DEST_DIR' is empty!\n"
        copy_font_to_dest_dir
    fi
}

function continue_font() {
    echo -e "$LGREEN Do you want to install Segoe-UI Font? (y)es, (n)o:"
    read  -p ' ' INPUT
    case $INPUT in
    [Yy]* ) font_install;;
    [Nn]* ) end;;
    * ) echo -e "$RED\n Sorry, try again."; continue_font;;
  esac
}

function copy_font_to_dest_dir() {
    echo -e "$LGREEN Do you want to copy Segoe-UI Font to the directory '$DEST_DIR'? (y)es, (n)o:"
    read  -p ' ' INPUT
    case $INPUT in
    [Yy]* ) font_install;;
    [Nn]* ) end;;
    * ) echo -e "$RED\n Sorry, try again."; copy_font_to_dest_dir;;
  esac
}

function font_install() {
    mkdir -p "$DEST_DIR"
    wget -q https://github.com/mrbvrz/segoe-ui/raw/master/font/segoeui.ttf?raw=true -O "$DEST_DIR"/segoeui.ttf > /dev/null 2>&1 # regular
    wget -q https://github.com/mrbvrz/segoe-ui/raw/master/font/segoeuib.ttf?raw=true -O "$DEST_DIR"/segoeuib.ttf > /dev/null 2>&1 # bold
    wget -q https://github.com/mrbvrz/segoe-ui/raw/master/font/segoeuii.ttf?raw=true -O "$DEST_DIR"/segoeuii.ttf > /dev/null 2>&1 # italic
    wget -q https://github.com/mrbvrz/segoe-ui/raw/master/font/segoeuiz.ttf?raw=true -O "$DEST_DIR"/segoeuiz.ttf > /dev/null 2>&1 # bold italic
    wget -q https://github.com/mrbvrz/segoe-ui/raw/master/font/segoeuil.ttf?raw=true -O "$DEST_DIR"/segoeuil.ttf > /dev/null 2>&1 # light
    wget -q https://github.com/mrbvrz/segoe-ui/raw/master/font/seguili.ttf?raw=true -O "$DEST_DIR"/seguili.ttf > /dev/null 2>&1 # light italic
    wget -q https://github.com/mrbvrz/segoe-ui/raw/master/font/segoeuisl.ttf?raw=true -O "$DEST_DIR"/segoeuisl.ttf > /dev/null 2>&1 # semilight
    wget -q https://github.com/mrbvrz/segoe-ui/raw/master/font/seguisli.ttf?raw=true -O "$DEST_DIR"/seguisli.ttf > /dev/null 2>&1 # semilight italic
    wget -q https://github.com/mrbvrz/segoe-ui/raw/master/font/seguisb.ttf?raw=true -O "$DEST_DIR"/seguisb.ttf > /dev/null 2>&1 # semibold
    wget -q https://github.com/mrbvrz/segoe-ui/raw/master/font/seguisbi.ttf?raw=true -O "$DEST_DIR"/seguisbi.ttf > /dev/null 2>&1 # semibold italic
    fc-cache -f "$DEST_DIR"
    echo -e "$GREEN\n Font installed on $LBLUE'$DEST_DIR'"
}

function install_wget() {
    sleep 1
    sudo apt update > /dev/null 2>&1
    sudo apt install -y wget > /dev/null 2>&1
}

function end() {
    echo -e "$LPURPLE\n Bye... ;)"
    exit 0
}

continue_wget() {
  echo -e "$LGREEN Do you want to install Wget? (y)es, (n)o :"
  read  -p ' ' INPUT
  case $INPUT in
    [Yy]* ) install_wget;;
    [Nn]* ) end;;
    * ) echo -e "$RED\n Sorry, try again."; continue_wget;;
  esac
}

function banner() {
    echo -e "$LYELLOW" ""
    echo -e "                                         _    __            _   "
    echo -e "                                        (_)  / _|          | |  "
    echo -e "  ___  ___  __ _  ___   ___        _   _ _  | |_ ___  _ __ | |_ "
    echo -e " / __|/ _ \/ _  |/ _ \ / _ \  __  | | | | | |  _/ _ \|  _ \| __|"
    echo -e " \__ \  __/ (_| | (_) |  __/ (__) | |_| | | | || (_) | | | | |_ "
    echo -e " |___/\___|\__, |\___/ \___|       \__,_|_| |_| \___/|_| |_|\__|"
    echo -e "            __/ |                                               "
    echo -e "           |___/             $LPURPLE mrbvrz$LCYAN -$RED https://hasansuryaman.com        "
    echo ""
    echo -e "$LYELLOW --------------------------------------------------------------- $RESTORE"
    echo -e " FONTS_DIR: $FONTS_DIR"
    echo ""
}

function main() {
    clear
    banner
    check_internet
    check_wget
    check_font
}
main
