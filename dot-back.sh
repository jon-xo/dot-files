#!/bin/sh

# Path variables
UXH=$HOME
PROJROOT=$(find $HOME -maxdepth 3 -path "$HOME/Library" -prune -o  -path "$HOME/.Trash" -prune -o -type d -name "dot-files" -print)

source $PROJROOT/cmds/detectOS.sh

# Call returnOS function found in detectOS script, 
# find the current OS, and store result in ostype argument
returnOS ostype

# Use getopts to allow '-v' option to echo current OS string
while getopts ":v" opt; do
    case ${opt} in
    v ) 
        if [[ -z $ostype ]];
        then
            echo "Current OS: undefined"
            break
        else    
            echo "Current OS: $ostype"
            break
        fi
        ;;
    \? ) 
        echo "Usage: dotback [-v]"
        ;;
    esac
done

if [[ "$ostype" == "mac" ]]; 
then

    macPath="$PROJROOT/macos"

    # change directory to home folder
    cd $UXH

    # list file names and run grep search which includes "bash, fzf, zsh" and excludes filenames with "history, swp, pre". Copy grep results to working directory.
    ls -1a | grep -i 'bash\|fzf\|zsh\|vim\|tmux\|NERD' | grep -v 'history\|swp\|pre\|log' | xargs -I '{}' cp -Rf '{}' $macPath

    # change directory to ~/.config folder
    cd $UXH/.config

    # Create .config path using -p option to create all necessary directories.
    mkdir -p $macPath/.config

    # list file names and run grep search which includes "nvim, powerline, coc, starship" and excludes filenames with "Microsoft, citra, torr, xbuild, config, karabiner, menus, yarn". Copy grep results to working directory.
    ls -1a | grep -i 'nvim\|powerline\|coc\|starship'  grep -v 'Microsoft\|citra\|torr\|xbuild\|config\|karabiner\|menus\|yarn' | xargs -I '{}' cp -Rf '{}' $macPath/.config

elif [[ $ostype == "linux" ]];
then    
    linuxPath="$PROJROOT/linux"

    # change directory to home folder
    cd $UXH

    # find hidden files with "." symbol, excluding multiple files from result, copy find results to repo directory.
    find . -maxdepth 1 -type f -name ".*" ! -name "*history" ! -name ".*dump*" ! -name ".*logout" ! -name ".sudo*" ! -name ".gitconfig" ! -name ".motd*" ! -name ".shell.pre*" ! -name ".netrc" ! -name ".ssh" | xargs -I '{}' cp -Rf '{}' $linuxPath

    # change directory to ~/.config folder
    cd $UXH/.config

    # Create .config path using -p option to create all necessary directories.
    mkdir -p $linuxPath/.config

    # list file names and run grep search which includes "nvim, powerline, coc, starship" and excludes filenames with "Microsoft, citra, torr, xbuild, config, karabiner, menus, yarn". Copy grep results to working directory.
    ls -1a | grep -i 'nvim\|coc\|starship' | grep -v 'Microsoft\|citra\|torr\|xbuild\|config\|karabiner\|mono\|menus\|yarn\|xbuild' | xargs -I '{}' cp -Rf '{}' $linuxPath/.config

fi

# Dynamically create crontab job and .CronSetupDone file,
# which prevents the cron-setup action to re-execute
# after successful completion.
source $PROJROOT/cron/cron-setup.sh

# ---- crontab notes ----
## $ crontab -e ...
# Execute cron job every 15 minutes
## ... */15 * * * * ~/bin/dot-files/dot-back.sh > /tmp/stdout.log 2>/tmp/stderr.log