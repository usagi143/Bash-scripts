#!/bin/bash 

#cat command-to-create.txt | grep -Ev "#|^$"

commands=()
namesDir=()

showHelp(){
    echo "Creates based on the command-to-create.txt file"
    echo "-m --> make a command of every uncommented line"
    echo "-----------------------------------------------"
    echo "--FILE RULES--"
    echo "-Choose which command want to create
-if the # symbol is in the line then that line will not be processed
-the # symbol works as a comment
-example --> envpy.sh this will make a command // #envpy.sh this will not beacuse it has the # a the beggining
-the command will be made in /usr/local/bin/ --> make sure to add this directory to the PATH if it is not there"
}

makeCommand(){
    while IFS= read -r nombre; do
        namesDir+=("$nombre")
        nombre="${nombre%.sh}"
        commands+=("$nombre")
    done < <(grep -Ev "#|^$" command-to-create.txt)  

    for ((i=0; i<${#commands[@]}; i++)); do
        nameDir="${namesDir[$i]}"  
        if [ -f "$nameDir" ]; then  
            cp "$nameDir" /usr/local/bin/  
            mv "/usr/local/bin/$nameDir" "/usr/local/bin/${commands[$i]}"  
        fi
    done
}

while getopts ":hm" opt; do
   case $opt in
       h)
         showHelp 
         ;;
       m)
         makeCommand
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
         







