# returnOS function uses the UNIX platform command 
# to detect if the host system uses MacOS or Ubuntu.

function returnOS() {
    # Store data returned by uname function to -a & -v options to display all data including kernel-name
    platform="$(uname -av)"

    # declare variable to reference argument passed to function
    local __resultvar=$1

    # declare local variables used with conditional to check os type
    lx="Linux"
    mx="Darwin"

    # Use regex to check if platform contains "Darwin" to detect macos kernel
    # *then* store mac string in foundos variable.
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
    if [[ $__resultvar ]]; 
    then
        eval $__resultvar="'$foundos'"
    else
        return 44
    fi
}