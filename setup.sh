RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root"
    sleep .5 
fi
echo "Running as root..."
sleep .5
clear
while true; do
    clear
        echo -e "${BLUE}${YELLOW} 1.${NC} ${CYAN}install needed pkgs${NC}         ${BLUE}${NC}"
        echo -e "${BLUE}${YELLOW} 2.${NC} ${CYAN}install swap${NC}         ${BLUE}${NC}"
        echo -e "${BLUE}${YELLOW} 3.${NC} ${CYAN}install needed pkgs and swap${NC}         ${BLUE}${NC}"
        echo -e "${BLUE}${YELLOW} 0.${NC} ${CYAN}exit${NC}         ${BLUE}${NC}"
        echo -e "This bash  was created by ${GREEN}ArmanATI${NC}\n"

    read -p "Enter option number: " choice
    case $choice in

          #install pkgs
        1)    
            clear
            echo -e "${GREEN}installing pkgs${NC}" 
            echo ""
            cd
            apt update && apt upgrade -y
            git clone https://github.com/akhilnarang/scripts
            cd scripts
            ./setup/android_build_env.sh
            sudo apt install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-gtk3-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev -y
            echo ""
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;
        
          #install swap
        2)
            clear
            echo -e "${GREEN}installing swap${NC}" 
            echo ""
            cd
            apt update && apt upgrade -y
            grep Swap /proc/meminfo
            sudo swapoff -a
            sudo dd if=/dev/zero of=/swapfile bs=1G count=32
            sudo chmod 0600 /swapfile
            sudo mkswap /swapfile
            sudo swapon /swapfile
            grep Swap /proc/meminfo
            echo ""
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;
            
          #install swap and pkgs
        3)    
            clear
            echo -e "${GREEN}installing swap and pkgs${NC}" 
            echo ""
            cd
            apt update && apt upgrade -y
            git clone https://github.com/akhilnarang/scripts
            cd scripts
            ./setup/android_build_env.sh
            sudo apt install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-gtk3-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev -y
            clear
            echo -e "${GREEN}installing swap${NC}" 
            echo ""
            cd
            apt update && apt upgrade -y
            grep Swap /proc/meminfo
            sudo swapoff -a
            sudo dd if=/dev/zero of=/swapfile bs=1G count=32
            sudo chmod 0600 /swapfile
            sudo mkswap /swapfile
            sudo swapon /swapfile
            grep Swap /proc/meminfo
            echo ""
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;
            
        # EXIT
        0)
            echo ""
            echo -e "${GREEN}Exiting...${NC}"
            echo "Exiting program"
            exit 0
            ;;
         *)
           echo "Invalid option. Please choose a valid option."
           echo ""
           echo -e "Press ${RED}ENTER${NC} to continue"
           read -s -n 1
           ;;
      esac
     done   
