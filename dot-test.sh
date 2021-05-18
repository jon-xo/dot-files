#!/bin/sh

linuxPath="~/bin/dot-files/linux"
macPath="~/bin/dot-files/macos"

function detectOS() {
    platform="$(uname -av)"
    local __resultvar=$1
    lx="Linux"
    mx="Darwin"

    if [[ "$platform" =~ .*"$mx".* ]]; then
        local foundos="mac" 
    elif [[ "$platform" =~ .*"$lx"*. ]]; then
        local foundos="linux"
    fi

    if [[ "$__resultvar" ]]; then
        eval $__resultvar="'$foundos'"
    else
        return 44
    fi
}

detectOS ostype
echo $ostype