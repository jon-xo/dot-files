#!/bin/sh

# Update variables to match local user paths per operating system

linuxPath="~/bin/dot-files/linux"
macPath="~/bin/dot-files/macos"

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
    # *then* store mac string in foundos variable.
    if [[ "$platform" =~ .*"$mx".* ]]; then
        local foundos="mac"
    # Use regex to check if platform varoable contains "Linux" to confirm OS
    # *then* store linux string in foundos variable.
    elif [[ "$platform" =~ .*"$lx"*. ]] || [[ "$platform" =~ .*"WSL"*. ]]; then
        local foundos="linux"
    fi

    # *if* argument was passed to function, set foundos variable equal to argument
    # *else* return 44
    if [[ "$__resultvar" ]]; then
        eval $__resultvar="'$foundos'"
    else
        return 44
    fi
}

detectOS ostype

if [[ "$ostype" == "mac" ]]; then

    # change directory to home folder
    cd ~

    # list file names and run grep search which includes "bash, fzf, zsh" and excludes filenames with "history, swp, pre". Copy grep results to working directory.
    ls -1a | grep -i 'bash\|fzf\|zsh\|vim\|tmux\|NERD' | grep -v 'history\|swp\|pre\|log' | xargs -I '{}' cp -Rf '{}' $macPath

    # change directory to ~/.config folder
    cd ~/.config

    # list file names and run grep search which includes "nvim, powerline, coc, starship" and excludes filenames with "Microsoft, citra, torr, xbuild, config, karabiner, menus, yarn". Copy grep results to working directory.
    ls -1a | grep -i 'nvim\|powerline\|coc\|starship' | grep -v 'Microsoft\|citra\|torr\|xbuild\|config\|karabiner\|menus\|yarn' | xargs -I '{}' cp -Rf '{}' $macPath

elif [[$ostype == "linux" ]]; then

    # change directory to home folder
    cd ~

    # list file names and run grep search which includes "bash, fzf, zsh" and excludes filenames with "history, swp, pre". Copy grep results to working directory.
    ls -1a | grep -i 'bash\|fzf\|zsh\|vim\|tmux\|NERD' | grep -v 'history\|swp\|pre\|log' | xargs -I '{}' cp -Rf '{}' $linuxPath

    # change directory to ~/.config folder
    cd ~/.config

    # list file names and run grep search which includes "nvim, powerline, coc, starship" and excludes filenames with "Microsoft, citra, torr, xbuild, config, karabiner, menus, yarn". Copy grep results to working directory.
    ls -1a | grep -i 'nvim\|powerline\|coc\|starship' | grep -v 'Microsoft\|citra\|torr\|xbuild\|config\|karabiner\|menus\|yarn' | xargs -I '{}' cp -Rf '{}' $linuxPath

fi

# Create conjob
## $ crontab -e
# Execute cron job every 15 minutes
## */15 * * * * ~/bin/dot-files/dot-back.sh > /tmp/stdout.log 2>/tmp/stderr.log
