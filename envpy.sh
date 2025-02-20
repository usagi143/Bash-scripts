#!/bin/bash

#directory where the python environment will be 
dirEnv=~/pythonEnvironments
if[ ! -d $dirEnv ]; then
    mkdir $dirEnv
fi

showAllDirectories(){
    ls $dirEnv
}

makeVirtualEnvironment(){
    local name=$1

    python -m venv $dirEnv/$name
}

removeVirtualEnvironment(){
    local removeName=$1
    if[ -d $dirEnv/$removeName]; then
        rm -rf 
    else
        echo "The directory does not exists"
    fi
}

while getopts ":sm:" opt; do
    case $opt in
        s)
          showAllDirectories
          ;;
        m)
          name=$OPTARG
          makeVirtualEnvironment "$name"
          ;;
        r)
          removeEnv=$OPTARG
          removeVirtualEnvironment "$removeEnv"   
          ;;
        \?)
           echo "Not suppoorted option -$OPTARG" >&2  
           exit 1
           ;;
        :)
          echo "-$OPTARG needs an argumet to work" >&2
          exit 1
          ;;
    esac    
done


#if $help; then
#    echo "-s --> show all virtual environments"
#    echo "-m [name] --> make a new virtual environment"
#    echo "-r --> remove a virtual environment"
#fi
