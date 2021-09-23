#!/bin/sh

# findOS script uses the UNIX platform command with specifc keywords
# to detect if host system uses MacOS or Unbuntu.


# Store data returned by uname function to -a & -v options to display all data including kernel-name
platform="$(uname -av)"

# declare variable to reference argument passed to function
# local __resultvar=$1

# declare local variables used with conditional to check os type
lx="Linux"
mx="Darwin"

# foundos=""

# Use regex to check if platform contains "Darwin" to detect macos kernel
# *then* store mac string in foundos variable.
if [[ "$platform" =~ .*"$mx".* ]]; 
then
    foundos="mac"
# Use regex to check if platform varoable contains "Linux" to confirm OS
# *then* store linux string in foundos variable.
elif [[ "$platform" == *"$lx"* ]]  || [[ "$platform" =~ .*"WSL"*. ]] || [[ "$platform" =~ .*"WSL2"*. ]]; 
then
    foundos="linux"
fi

while getopts ":v" opt; do
    case ${opt} in
    v ) 
        echo "$platform"
        echo " >>> $foundos detected"
        ;;
    \? )
        echo "Usage: findOS [-v]"
        exit 2
        ;;
    esac
done

exit 0