#!/bin/sh

# Path variables
NULL="/dev/null"
UXH=$HOME
PROJROOT=$(find $HOME -maxdepth 3 -path "$HOME/Library" -prune -o  -path "$HOME/.Trash" -prune -o -type d -name "dot-files" -print)
source $PROJROOT/cmds/detectOS.sh

# Call returnOS function found in detectOS script, 
# find the current OS, and store result in ostype argument
returnOS ostype

selection = true

# local functions
function makeAlias() {
    echo "Creating Symlinks..."
    ln -sf $UXH $PROJROOT/$ostype/.bash_profile 2> $NULL && echo "Linking: .bash_profile"
    ln -sf $UXH $PROJROOT/$ostype/.bash_rc 2> $NULL && echo "Linking: .bash_rc"
    ln -sf $UXH $PROJROOT/$ostype/.gitignore_global 2> $NULL && echo "Linking: .gitignore_global"    
}

function copyDots() {
    echo "Copying dot files..."
    if [[ "$ostype" == "mac" ]]; 
    then
        macPath="$PROJROOT/macos"

        cp -rv $macPath $UXH

    elif [[ $ostype == "linux" ]];
    then    
        linuxPath="$PROJROOT/linux"

        cp -rv $linuxPath $UXH
    fi
}

function checkGit() {
    git --version 2> $NULL
    p1=$?
}

function gitClone() {
    git clone $1:$2 https://github.com/jon-xo/dot-files.git
    gc=$?
}

while $selection; do
    echo "dot-restore"
    echo "-----------"
    echo "Select an option:"
    echo " [1] Restore $ostype dot files from exisiting dot-back repo"
    echo " [2] Download dot-back repo & restore $ostype dot files [Requires Github Oauth token]"
    echo " [3] Cancel restore & exit"
    read usr-option
    case $usr-option in
        1*)
            makeAlias
            copyDots
            echo ""
            echo "✅ Restore complete"
            exit
        ;;
        2*)
            if [[ $p1 -ne "0" ]]
            then
                echo ""
                read -p "🗣 Enter in Github username: " GUSER
                read -ps "🔐 Enter in Github personal access token: " GTOKEN
                read -p "Enter Directory Path relative to $UXH e.g. bin: " GPATH
                
                mkdir -p $UXH/$GPATH
                cd $UXH/$GPATH
                gitClone "$GUSER" "$GTOKEN"
                 if [[ $gc -ne "0" ]]
                 then
                    makeAlias
                    copyDots
                    echo ""
                    echo "✅ Restore complete"
                    exit
                else
                    echo "⛔ Unable to git clone the dot-back repo."
                    echo "Please check your git username and personal access token and try again."
                    echo "Reference: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token"
                    exit 42
            else
                echo "⛔ git not found!"
                echo "Try installing gite.g. sudo apt update && sudo apt install git"
                echo "Example: sudo apt update && sudo apt install git"
            fi
        ;;
        3*)
            exit
        ;;