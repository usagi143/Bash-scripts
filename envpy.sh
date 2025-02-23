#!/bin/bash

#directory where the python environment will be 
dirEnv=~/pythonEnvironments
if [ ! -d $dirEnv ]; then
    mkdir $dirEnv
fi

showHelp(){
    echo "-s --> show all virtual environments"
    echo "-m [name] --> make a new virtual environment"
    echo "-r [NAME] --> remove a virtual environment"
    echo "-v [NAME] --> view all libraries installed"
    echo "-a [NAME] --> activate a virtual environment *you need to use source envpy -a [NAME]*"
}
showAllDirectories(){
    ls $dirEnv
}

makeVirtualEnvironment(){
    local name=$1
    echo "Creating the environment ..." 
    python -m venv $dirEnv/$name
    echo "Creation finished"
}

removeVirtualEnvironment(){
    existsFile
    rm -rf $dirEnv/$1
    echo "Remove successful" 
}
 
existsFile(){ 
    if [ -d $dirEnv/$removeName ]; then
        rm -rf 
    else
        echo "The directory does not exists"
        exit 1
    fi
}

showLibrariesInstalled(){
    existsFile
    source $dirEnv/$1/bin/activate
    pip list
    deactivate
}

activateEnvironment(){
  existsFile
  source $dirEnv/$1/bin/activate
}

while getopts ":sm:r:v:a:h" opt; do
    case $opt in
        s)
          showAllDirectories
          ;;
        m)
          makeVirtualEnvironment "$OPTARG"
          ;;
        r)
          removeVirtualEnvironment "$OPTARG"   
          ;;
        v)
          showLibrariesInstalled "$OPTARG"
          ;;
        a)
          activateEnvironment "$OPTARG"
          ;;
        h)
          showHelp 
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


