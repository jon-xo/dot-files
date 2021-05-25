#!/bin/sh

# Update variables to match local user paths per operating system

UXH=$HOME

# declare detectOS function
function detectOS() {
    # Store data returned by uname function to -a & -v options to display all data including kernel-name
    platform="$(uname -av)"

    # declare variable to reference argument passed to function
    local __resultvar=$1

    # declare local variables used with conditional to check os type
    lx="Linux"
    mx="Darwin"

    # Use regex to check if platform contains "Darwin" to detect macos kernel
    # *then* store ma c string in foundos variable.
    if [[ "$platform" =~ .*"$mx".* ]]; 
    then
        local foundos="mac"
    # Use regex to check if platform varoable contains "Linux" to confirm OS
    # *then* store linux string in foundos variable.
    elif [[ "$platform" =~ .*"$lx"*. ]] || [[ "$platform" =~ .*"WSL"*. ]]; 
    then
        local foundos="linux"
    fi

    # *if* argument was passed to function, set foundos variable equal to argument
    # *else* return 44
    if [[ "$__resultvar" ]]; 
    then
        eval $__resultvar="'$foundos'"
    else
        return 44
    fi
}

detectOS ostype

if [[ "$ostype" == "mac" ]]; 
then

    PROJROOT=$(find $HOME -path "$HOME/Library" -prune -o  -path "$HOME/.Trash" -prune -o -type d -maxdepth 3  -name "dot-files" -print)
    macPath="$PROJROOT/macos"


    # change directory to home folder
    cd $UXH

    # list file names and run grep search which includes "bash, fzf, zsh" and excludes filenames with "history, swp, pre". Copy grep results to working directory.
    ls -1a | grep -i 'bash\|fzf\|zsh\|vim\|tmux\|NERD' | grep -v 'history\|swp\|pre\|log' | xargs -I '{}' cp -Rf '{}' $macPath

    # change directory to ~/.config folder
    cd $UXH/.config

    # list file names and run grep search which includes "nvim, powerline, coc, starship" and excludes filenames with "Microsoft, citra, torr, xbuild, config, karabiner, menus, yarn". Copy grep results to working directory.
    ls -1a | grep -i 'nvim\|powerline\|coc\|starship' | grep -v 'Microsoft\|citra\|torr\|xbuild\|config\|karabiner\|menus\|yarn' | xargs -I '{}' cp -Rf '{}' $macPath

elif [[ $ostype == "linux" ]];
then

    PROJROOT=$(find $UXH -maxdepth 3 -type d -name "dot-files")
    linuxPath="$PROJROOT/linux"

    # change directory to home folder
    cd $UXH

    # find hidden files with "." symbol, excluding multiple files from result, copy find results to repo directory.
    find . -maxdepth 1 -type f -name ".*" ! -name "*history" ! -name ".*dump*" ! -name ".*logout" ! -name ".sudo*" ! -name ".gitconfig" ! -name ".motd*" ! -name ".shell.pre*" ! -name ".netrc" | xargs -I '{}' cp -Rf '{}' $linuxPath

    # change directory to ~/.config folder
    cd $UXH/.config

    # Create .config path using -p option to create all necessary directories.
    mkdir -p $linuxPath/.config


    # list file names and run grep search which includes "nvim, powerline, coc, starship" and excludes filenames with "Microsoft, citra, torr, xbuild, config, karabiner, menus, yarn". Copy grep results to working directory.
    ls -1a | grep -i 'nvim\|coc\|starship' | grep -v 'Microsoft\|citra\|torr\|xbuild\|config\|karabiner\|menus\|yarn' | xargs -I '{}' cp -Rf '{}' $linuxPath/.config

fi

# Dynamically create crontab and local file to verify cron-setup has run,
# and to prevent additional execution.
source $PROJROOT/cron/cron-setup.sh

# ---- crontab notes ----
## $ crontab -e ...
# Execute cron job every 15 minutes
## ... */15 * * * * ~/bin/dot-files/dot-back.sh > /tmp/stdout.log 2>/tmp/stderr.log