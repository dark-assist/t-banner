#!/data/data/com.termux/files/usr/bin/bash
# This is a simple bash script for setuping a bountiful banner for Termux..
#cradit Sanatani-hacker.
echo "TERMUX BANNER SETUP SCRIPT BY SANATANI-HACKER"
echo "Telegram: https://t.me/temuxhacking"
echo "Github: https://github.com/dark-assist"
sleep 2
# Function to create a banner
create_banner() {
    # Prompt user for banner name
    read -p "Enter banner name: " banner_name

    # Prompt user for font name
    read -p "Enter font name: " font_name
    # Generate the banner using figlet
    figlet -f "$font_name" -c -t -k -p "$banner_name" > $HOME/.banner.txt
    echo "cat $HOME/.banner.txt|lolcat" >> $HOME/.bashrc
    echo "Banner created successfully!"
}

# Function to show available Figlet fonts
show_fonts() {
    echo "Selected Figlet Fonts:"
    echo "-----------------------"

selected_fonts=(
    "3D-ASCII"
    "ANSI Regular"
    "ANSI Shadow"
    "Caligraphy"
    "Colossal"
    "Cybermedium"
    "Dancing Font"
    "Diet Cola"
    "Fire Font-k"
    "Graffiti"
    "Kban"
    "Larry 3D"
    "Letters"
    "Mini"
    "Roman"
    "Small"
    "Soft"
    "Speed"
    "Star Wars"
    "Sweet"
    "Tanja"
    "The Edge"
    "Univers"
    "Wavy"
    "Wow"
)


    for font in "${selected_fonts[@]}"
    do
        echo "$font"
    done
}




remove() {
        cd $HOME
        rm .banner.txt
        sed -i '/cat \/data\/data\/com.termux\/files\/home\/.banner.txt|lolcat/d' .bashrc
}
setup() {
	apt update
	apt install figlet lolcat -y
	clear
}


# Display menu options
echo "Menu Options:"
echo "0. Setup"
echo "1. Create Banner"
echo "2. Show Available Fonts"
echo "3. Remove Banner"
echo "99. Exit"
read -p "Choose an option : " option

# Perform selected action
case $option in
    0)
	setup && bash banner.sh
	;;
    1)
        create_banner
        ;;
    2)
        show_fonts && bash banner.sh
        ;;
    3)
	remove
	;;
    99)
	echo "bye......" && exit
	;;
    *)
        echo "Invalid option." && sleep 2 && bash banner.sh >&2
        ;;
esac
