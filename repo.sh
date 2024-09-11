#!/bin/bash

#banner
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use 'sudo' or log in as root."
    exit 1
fi


# Define the characters for the progress bar
arr=('-' '\' '|' '/')

# Define the host to ping
host="google.com"

# Initialize the progress bar character index
i=0

echo "checking hosts connection.."

while true; do
  # Ping the host and check the result
  if ping -c 1 $host &> /dev/null; then
    # If the ping is successful, print a success message and exit
    echo "Ping successful!"
    exit 0
  else
    # If the ping fails, print the progress bar and update the character
    echo -en "\r${arr[$i]} Pinging $host... "
    i=$(( (i+1) % ${#arr[@]} ))  # Cycle through the characters
    sleep 0.5
  fi
done

echo "  
    1) Debian 10 (Buster)
    2) Debian 11 (Bullseye)
    3) Debian 12 (Bookworm)
"
read -p "choose debian: " repo

debian12="
deb http://deb.debian.org/debian bookworm main contrib non-free
deb http://security.debian.org/debian-security bookworm-security main contrib non-free
"
debian11="
deb http://deb.debian.org/debian bullseye main contrib non-free
deb http://security.debian.org/debian-security bullseye-security main contrib non-free
"
debian10="
deb http://deb.debian.org/debian buster main contrib non-free
deb http://security.debian.org/debian-security buster-security main contrib non-free
"

echo "backup files.."

cp /etc/apt/sources.list /etc/apt/sources.list.bak

cp /etc/apt/sources.list /etc/apt/sources.list_temp

temp="/etc/apt/sources.list_temp"

case "$repo" in
1)
    sed -i "/dvd/d" "$temp" &&
        echo "${debian10}" >>"$temp"
    if [ $? -ne 0 ]; then
        echo "err: unkown error"
    else
        mv $temp /etc/apt/sources.list
        echo "sucessfully change repo"
    fi
    ;;
2)
    sed -i "/dvd/d" "$temp"
    # echo $debian11 >> "$temp"
    if [ $? -ne 0 ]; then
        echo "err: unkown error"
    else
        mv $temp /etc/apt/sources.list
        echo "sucessfully change repo"
    fi
    ;;

3)
    sed -i "/dvd/d" "$temp" &&
        echo "${debian12}" >>"$temp"
    if [ $? -ne 0 ]; then
        echo "err: unkown error"
    else
        mv $temp /etc/apt/sources.list
        echo "sucessfully change repo"
    fi
    ;;

esac
