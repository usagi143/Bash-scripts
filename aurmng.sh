#!/bin/bash

#simple command for manage aur package

#curl 'https://aur.archlinux.org/packages?O=0&SeB=nd&K=qt&outdated=&SB=p&SO=d&PP=50&submit=Go' | grep packages |awk -F "/" '{print $3}' | rev | awk '{print substr($1, 3)}' | rev | grep -Ev "=|www|<|>|>"

#curl https://aur.archlinux.org/packages/nombre-paquete | grep "(read-only, click to copy)" | awk -F '"' '{print $4}'

programsDir=$HOME/Programs/

helpAur(){
    echo "hola"
}

searchPackets(){
    packet=$1
    curl 'https://aur.archlinux.org/packages?O=0&SeB=nd&K=$packepackepackettt&outdated=&SB=p&SO=d&PP=50&submit=Go' | grep packages |awk -F "/" '{print $3}' | rev | awk '{print substr($1, 3)}' | rev | grep -Ev "=|www|<|>|>"
}

installPackets(){
    git clone $(https://aur.archlinux.org/packages/$1 | grep "(read-only, click to copy)" | awk -F '"' '{print $4}')

    cd $1

    makepkg -si
}

removePackets(){
    rm -rf programsDir/$1

    #sudo pacman -R $1

}

viewInstalledPackets(){
    ls programsDir/
}

while getopts ":hs:i:r:v" opt; do
    case $opt in
        h)
          helpAur
          ;;
        s)
          searchPackets $OPTARG
          ;;
        i)
          installPackets $OPTARG
          ;;
        r)
          removePackets $OPTARG
          ;;
        v)
          viewInstalledPackets
          ;;
        \?)
          echo "Not supported option -$OPTARG" >&2
          exit 1
          ;;
        :)
          echo "-$OPTARG needs an argument to work" >&2
          exit 1
          ;;
    esac
done  





