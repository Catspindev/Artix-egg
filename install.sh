#!/bin/bash

function display {
    echo -e "\033c"
    echo "
                _   _         _____           _                     
     /\        | | (_)       / ____|         | |                    
    /  \   _ __| |_ ___  __ | (___  _   _ ___| |_ ___ _ __ ___  ___ 
   / /\ \ | '__| __| \ \/ /  \___ \| | | / __| __/ _ \ '_ ` _ \/ __|
  / ____ \| |  | |_| |>  <   ____) | |_| \__ \ ||  __/ | | | | \__ \
 /_/    \_\_|   \__|_/_/\_\ |_____/ \__, |___/\__\___|_| |_| |_|___/
                                     __/ |                          
                                    |___/                           
    ==========================================================================
    Server Version: Paper 1.20.1
    MOTD: Artix.cloud | Change this MOTD in server.properties
    ==========================================================================
    "  
}

function forceStuffs {
    echo "motd=Artix.cloud | Change this motd in server.properties" >> server.properties
}

function launchJavaServer {
    java -Xms1024M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper-server.jar nogui
}

function optimizeJavaServer {
    echo "view-distance=6" >> server.properties
} 

EULA_FILE=eula.txt

if [ ! -f "$EULA_FILE" ]; then
    mkdir -p plugins
    display
    sleep 5

    echo "$(tput setaf 3)Which platform are you gonna use?"
    echo "1) Paper 1.8.8    2) Paper 1.12.2    3) Paper 1.15.2    4) Paper 1.16.5    5) Paper 1.17.1    6) Paper 1.18.2    7) Paper 1.19.2    8) Paper 1.20.1    9) BungeeCord    10) Node.js"
    read -r n

    case $n in
        1) 
            echo "$(tput setaf 3)Starting the download for 1.8.8 please wait"
            sleep 4
            forceStuffs
            curl -O https://api.papermc.io/v2/projects/paper/versions/1.8.8/builds/445/downloads/paper-1.8.8-445.jar
            display
            echo "$(tput setaf 1)Invalid docker image. Change it to java 8"
            sleep 10
            echo -e ""
            optimizeJavaServer
            launchJavaServer
            ;;
        2) 
            echo "$(tput setaf 3)Starting the download for 1.12.2 please wait"
            sleep 4
            forceStuffs
            curl -O https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/1620/downloads/paper-1.12.2-1620.jar
            display   
            echo "$(tput setaf 1)Invalid docker image, otherwise it will not work. Change it to java 11"
            sleep 10
            echo -e ""
            optimizeJavaServer
            launchJavaServer
            ;;
        3) 
            echo "$(tput setaf 3)Starting the download for 1.15.2 please wait"
            sleep 4
            forceStuffs
            curl -O https://api.papermc.io/v2/projects/paper/versions/1.15.2/builds/393/downloads/paper-1.15.2-393.jar
            display   
            echo "$(tput setaf 1)Invalid docker image. Change it to java 16"
            sleep 10
            echo -e ""
            optimizeJavaServer
            launchJavaServer
            ;;
        4)
            echo "$(tput setaf 3)Starting the download for 1.16.5 please wait"
            sleep 4
            forceStuffs
            curl -O https://api.papermc.io/v2/projects/paper/versions/1.16.5/builds/794/downloads/paper-1.16.5-794.jar
            display
            echo "$(tput setaf 1)Invalid docker image. Change it to java 16"
            sleep 10
            echo -e ""
            optimizeJavaServer
            launchJavaServer
            ;;
        5) 
            echo "$(tput setaf 3)Starting the download for 1.17.1 please wait"
            sleep 4
            forceStuffs
            curl -O https://api.papermc.io/v2/projects/paper/versions/1.17.1/builds/411/downloads/paper-1.17.1-411.jar
            display
            sleep 10
            echo -e ""
            optimizeJavaServer
            launchJavaServer
            ;;
        6)
            echo "$(tput setaf 3)Starting the download for 1.18.2 please wait"
            sleep 4
            forceStuffs
            curl -O https://api.papermc.io/v2/projects/paper/versions/1.18.2/builds/388/downloads/paper-1.18.2-388.jar
            display
            sleep 10
            echo -e ""
            optimizeJavaServer
            launchJavaServer
            ;;
        7)
            echo "$(tput setaf 3)Starting the download for 1.19.2 please wait"
            sleep 4
            forceStuffs
            curl -O https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/190/downloads/paper-1.19.2-190.jar
            display
            sleep 10
            echo -e ""
            optimizeJavaServer
            launchJavaServer
            ;;
        8)
            echo "$(tput setaf 3)Starting the download for 1.20.1 please wait"
            sleep 4
            forceStuffs
            curl -O https://api.papermc.io/v2/projects/paper/versions/1.20.1/builds/1/downloads/paper-1.20.1-1.jar
            display
            echo "$(tput setaf 1)Invalid docker image. Change it to java 17"
            sleep 10
            echo -e ""
            optimizeJavaServer
            launchJavaServer
            ;;
        9)
            echo "$(tput setaf 3)Starting Download please wait"
            curl -O https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
            display 
            java -Xms512M -Xmx512M -jar BungeeCord.jar
            ;;
        10)
            echo "$(tput setaf 3)Starting Download please wait"
            curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
            sudo apt-get install -y nodejs
            ;;
        *) 
            echo "Error 404"
            exit
            ;;
    esac  
else
    if [ -f plugins ]; then
        mkdir plugins
    fi

    if [ -f BungeeCord.jar ]; then
        display
        java -Xms512M -Xmx512M -jar BungeeCord.jar
    fi

    if [ -d plugins ]; then
        mkdir -p plugins
    fi

    display   
    launchJavaServer
fi
